module SessionsHelper
  def login(user)
    session[:user_id] = user.id
  end

   # 現在のユーザーをログアウトする
  def logout
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
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
    !current_user.nil?
  end

end
