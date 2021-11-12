class UsersEditController < ApplicationController
  def show
    @user = User.find(id: params[:id])
  end
end
