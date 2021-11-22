class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if !user.nil? && user.authenticate(email: params[:session][:email])
      log_in user
      redirect_to user
      session[:id] = user.id, notice: 'ログイン成功'
    else
      flash.now[:danger] = '登録に失敗しました'
      render 'new'
      session.delete(:id)
    end

  end

  def destroy
  end

end
