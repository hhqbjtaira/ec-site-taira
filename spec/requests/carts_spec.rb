require "rails_helper"

RSpec.describe "Carts", type: :request do
  let(:user) { create(:user) }

  describe "ログインしている状態" do
    let(:rspec_session) { { user_id: user } }

    describe "carts#show" do
      context "カート内が空の場合" do
        it "カート画面が表示される" do
          get carts_show_path
          expect(response.status).to eq 200
        end
      end
    end
  end
end
