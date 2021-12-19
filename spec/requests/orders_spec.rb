require 'rails_helper'

RSpec.describe "Orders", type: :request do
  let(:user) { create(:user) }
  let(:order) { create(:order, user_id: user.id) }
  describe "アクションのテスト" do

    describe "GET /orders/show" do
      it "オーダー詳細画面の表示に成功すること" do
        get order_path(order)
        expect(response.status).to eq 200
      end
    end

    describe "GET /orders/index" do
      before do
        @current_user = user
        order
      end

      it "注文履歴の表示に成功すること" do
        current_user = @current_user
        get orders_path
        expect(response.status).to eq 200
      end
    end

    describe "POST /orders/create" do
      let(:order_detail) { create(:order_detail, order_id: order.id, product_id: product.id) }
      let(:product) { create(:product) }
      let(:rspec_session) { { cart: product } }
      context "カート内が空の場合" do
        before do
          RSpec.configuration.session[:cart] = []
        end

        it "期待した結果が返ってくる" do
          order_detail = nil
          post '/orders'
          expect(response).to redirect_to("http://www.example.com/carts/show")
        end
      end

      context "カート内に商品がある場合" do
        before do
          @current_user = user
          order
        end

        it "ユーザーに紐づくオーダーが作られる" do
          current_user = @current_user
          post '/orders'
          expect(response).to have_http_status(200)
        end
      end
    end

    # context "GET /orders/purchase_completed" do
    #   it "購入完了画面の表示に成功すること" do
    #     current_user = user
    #     # byebug
    #     get purchase_completed_path(order)
    #     expect(response.status).to eq 200
    #   end
    # end
  end
end
