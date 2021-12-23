require "rails_helper"

RSpec.describe "StaticPages", type: :request do
  describe "GET /static_pages/home" do
    it "Top画面の表示に成功すること" do
      get root_path
      expect(response).to have_http_status(:ok)
    end
  end
end
