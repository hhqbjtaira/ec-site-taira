require "rails_helper"

RSpec.describe "Carts", type: :request do
  let(:user) { create(:user) }

  describe "ログインしている状態" do
    let(:rspec_session) { { user_id: user } }

    describe "carts#show" do
      let(:product) { create(:product) }
      let(:rspec_session) { { cart: product, user_id: user } }

      context "カート内が空の場合" do
        before do
          RSpec.configuration.session[:cart] = []
        end

        it "カート画面が表示される" do
          get carts_show_path
          expect(response.status).to eq 200
        end
      end
    end
  end
end
