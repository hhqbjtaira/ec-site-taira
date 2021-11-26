class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if !user.nil? && user.authenticate(params[:session][:password])
      login user
      # 認証成功の場合
      redirect_to user
    else
      flash.now[:danger] = "登録に失敗しました"
      # 認証失敗の場合
      render "new"
    end
  end

  def destroy
    logout if logged_in?
    flash[:danger] = "ログアウトしました"
    redirect_to login_path
  end
end
