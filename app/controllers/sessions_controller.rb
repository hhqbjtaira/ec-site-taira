class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if !user.nil? && user.authenticate(params[:session][:password])
      login user
      redirect_to user
    else
      flash.now[:danger] = "登録に失敗しました"
      render "new"
    end
  end

  def destroy
    logout if logged_in?
    flash[:danger] = "ログアウトしました"
    redirect_to login_path
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: "guest@example.com") do |user|
      user.password = "guestlogin"
      user.last_name = "guest"
      user.first_name = "guest"
      user.zipcode = "111-1111"
      user.prefecture = "沖縄県"
      user.municipality = "宮古島市"
      user.address = "平良下里"
      user.apartments = "1-1-14"
      user.email = "guest@example.com"
      user.phone_number = "09012345678"
      user.user_classification_id = 2
      user.company_name = "株式会社guest"
    end
    login user
    redirect_to root_path, notice: "ゲストユーザーとしてログインしました。"
  end
end
