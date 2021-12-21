require 'rails_helper'

RSpec.describe Order, type: :model do

  describe "インスタンスメソッドのテスト" do
    let(:product) { create(:product) }
    let(:product_2) { create(:product) }
    let!(:order_detail) { create(:order_detail, product_id: product.id, order_id: order.id, shipment_status_id: shipment_status.id) }
    let!(:order_detail_2) { create(:order_detail, product_id: product_2.id, order_id: order.id, shipment_status_id: shipment_status.id) }
    let(:shipment_status) { create(:shipment_status) }
    let(:order) { create(:order) }

    context "注文の状態確認ができる" do
      it "発送状態が確認できる" do
        expect(order.order_preparing?).to eq true
      end

      it "合計金額が確認できる" do
        expect(order.total_price).to eq 20000
      end
    end
  end

  describe "アソシエーションのテスト" do
    context "userモデルとの関係" do
      it "N:1となっている" do
        expect(Order.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context "order_detailsモデルとの関係" do
      it "1:Nとなっている" do
        expect(Order.reflect_on_association(:order_details).macro).to eq :has_many
      end
    end

  end
end
