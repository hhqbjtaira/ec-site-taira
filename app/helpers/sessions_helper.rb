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

   # ユーザーがログインしていればtrue、その他ならfalseを返す
   def logged_in?
    !current_user.nil?
  end

end
