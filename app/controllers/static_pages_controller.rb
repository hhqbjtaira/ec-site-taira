class StaticPagesController < ApplicationController
  def home
    @user = User.find_by(id: params[:id])
  end

  def home_after_login
    @user = User.find_by(id: params[:id])
  end
end
