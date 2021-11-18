class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "ユーザーを登録しました。こちらからログインしてください。"
      redirect_to login_path
    else
      flash.now[:alert] = "登録に失敗しました"
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :last_name,
      :first_name,
      :zipcode,
      :prefecture,
      :municipality,
      :address,
      :apartments,
      :email,
      :phone_number,
      :password,
      :password_confirmation,
    )
  end
end
