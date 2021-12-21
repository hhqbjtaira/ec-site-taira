require 'rails_helper'

RSpec.describe "Orders", type: :request do
  let(:user) { create(:user) }
  let(:order) { create(:order, user_id: user.id) }
  describe "アクションのテスト" do

      context "GET /orders/show" do
        it "オーダー詳細画面の表示に成功すること" do
          get order_path(order)
          expect(response.status).to eq 200
        end
      end

      context "GET /orders/index" do
        it "注文履歴の表示に成功すること" do
          get orders_path
          expect(response.status).to eq 200
        end
      end

      describe "POST /orders/create" do
        
        let(:order_detail) { create(:order_detail, order_id: order.id, product_id: RSpec.configuration.session[:cart][0]["product_id"], shipment_status_id: shipment_status.id, order_quantity: RSpec.configuration.session[:cart][0]["quantity"]) }
        let(:product) { create(:product) }
        let(:shipment_status) { create(:shipment_status)}
        let(:rspec_session) { { cart: product, user_id: user } }

        context "カート内が空の場合" do
          before do
            RSpec.configuration.session[:cart] = []
          end

          it "カート画面に遷移" do
            order_detail = nil
            post orders_path
            expect(response).to redirect_to carts_show_path
          end
        end

        context "カート内に商品がある場合" do
          before do
            RSpec.configuration.session[:cart] = [
              "product_id" => product.id,
              "quantity" => 3
            ]
          end
          it "ユーザーに紐づくオーダーが作られる" do
            expect{
              post orders_path
            }.to change(Order, :count).by(1)
          end

          context "orders#create内でオーダーの情報が必要なテスト" do
            let!(:order) { create(:order, user_id: user.id, order_date: Time.current, order_number: rand(9_999_999_999_999_999)) }

            it "注文詳細が作られる" do
              expect{
                post orders_path
                RSpec.configuration.session[:cart] = [
                  "product_id" => product.id,
                  "quantity" => 3
                ]
                order_detail
              }.to change(OrderDetail, :count).by(1)
            end

            it "カート内が空になっている" do
              post orders_path
              expect(RSpec.configuration.session[:cart]).to eq []
            end
          end

          it "購入完了画面に遷移" do
            post orders_path
            order = Order.last
            expect(response).to redirect_to purchase_completed_path(order_id: order.id)
          end
        end
      end

      context "GET /orders/purchase_completed" do
        let(:order) { create(:order, user_id: user.id, order_date: Time.current, order_number: rand(9_999_999_999_999_999)) }

        it "購入完了画面の表示に成功すること" do
          get purchase_completed_path(order_id: order.id)
          expect(response.status).to eq 200
        end
      end

      describe "DELETE /orders/destroy" do
        let!(:order) { create(:order, user_id: user.id, order_date: Time.current, order_number: rand(9_999_999_999_999_999)) }
        let(:shipment_status) { create(:shipment_status, id: 1) }
        let(:order_detail) { create(:order_detail, order_id: order.id, shipment_status_id: shipment_status.id) }

        it "注文キャンセル" do
          order_detail
          order.order_details
          expect do
            delete order_path(order)
          end.to change(OrderDetail, :count).by(-1)
        end

        context "注文詳細が空の場合" do
          before do
            order.order_details = []
          end

          it "注文キャンセル後にオーダーを削除する" do
            expect do
              delete order_path(order)
            end.to change(Order, :count).by(-1)
          end

          it "注文履歴に遷移" do
            delete order_path(order)
            expect(response).to redirect_to orders_path
          end
        end
      end
    end
  end
end
