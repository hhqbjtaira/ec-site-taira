class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if !user.nil? && user.authenticate(email: params[:session][:email])
      log_in user
      redirect_to  products_path
    else
      flash.now[:danger] = '登録に失敗しました'
      render 'new'
    end

  end

  def destroy
  end

end
