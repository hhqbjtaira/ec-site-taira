class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(id: params[:id])
    if !user.nil? && user.authenticate(id: params[:id])
      log_in user
      redirect_to user
      session[:id] = user.id
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
      session.delete(:id)
    end
  end

  def destroy
  end

end
