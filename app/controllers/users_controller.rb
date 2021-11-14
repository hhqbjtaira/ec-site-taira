class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id]).update(user_params)
  end

  private
  def user_params
    paramas.requie(:user).permit(:last_name,
                                :first_name,
                                :zipcode,
                                :prefecture,
                                :municipality,
                                :address,
                                :apartments,
                                :phone_number,
                                :email )
  end
end
