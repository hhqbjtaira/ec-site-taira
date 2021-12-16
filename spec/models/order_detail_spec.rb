require "rails_helper"

RSpec.describe OrderDetail, type: :model do
  describe "インスタンスメソッドのテスト" do
    before do
      @order_detail = create(:order_detail)
      product = @order_detail.product
      product.price = 500
      @order_detail.order_quantity = 2
    end

    context "商品詳細で個数と商品の値段の小計" do
      it "値段×個数となっている" do
        order_detail = @order_detail
        expect(order_detail.subtotal_price).to eq 1000
      end
    end
  end

  describe "アソシエーションのテスト" do
    context "productモデルとの関係" do
      it "N:1となっている" do
        expect(OrderDetail.reflect_on_association(:product).macro).to eq :belongs_to
      end
    end

    context "orderモデルとの関係" do
      it "N:1となっている" do
        expect(OrderDetail.reflect_on_association(:order).macro).to eq :belongs_to
      end
    end

    context "shipment_statusモデルとの関係" do
      it "N:1となっている" do
        expect(OrderDetail.reflect_on_association(:shipment_status).macro).to eq :belongs_to
      end
    end
  end
end
