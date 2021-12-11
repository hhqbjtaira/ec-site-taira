module SessionsHelper
  def login(user)
    session[:user_id] = user.id
  end

  # 現在のユーザーをログアウトする
  def logout
    session.delete(:user_id)
    @current_user = nil # rubocop:disable Style/AvoidFor
  end

  # current_user を定義
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # current_userがログイン済みユーザーであればtrueを返す
  def current_user?(user)
    user == current_user
  end

  # current_userが存在するならユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    current_user.present?
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "ログインしてください"
      redirect_to login_path
    end
  end

  def correct_user
    user = User.find_by(id: params[:id])
    if current_user != user
      flash[:danger] = "他人の情報にアクセスすることはできません。"
      redirect_to root_path
    end
  end

  def ensure_guest_user
    if guest_user?
      redirect_to edit_user_path, alert: "ゲストユーザーの情報変更や削除はできません。"
    end
  end

  def guest_user?
    current_user.email == "guest@example.com"
  end
end
