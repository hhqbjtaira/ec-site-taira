class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]

  include SessionsHelper

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.user_classification_id = 2
    if @user.save
      flash[:success] = "ユーザーを登録しました。こちらからログインしてください。"
      redirect_to login_path
    else
      flash.now[:danger] = "登録に失敗しました。"
      render "new"
    end
  end

  def update
    if @user.update(user_params)
      flash[:success] = "#{@user.name}さんの基本情報を更新しました。"
      redirect_to ＠user
    else
      flash.now[:danger] = @user.errors.full_messages
      render "edit"
    end
  end

  def edit
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

    def logged_in_user
      unless logged_in?
        flash[:danger] = 'ログインしてください'
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find_by(id: params[:id])
      if current_user != user
        flash[:danger] = '他人のユーザー情報を編集することはできません'
        redirect_to root_url
      end
    end
end
