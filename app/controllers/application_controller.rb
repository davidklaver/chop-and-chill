class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authenticate_user!
    redirect_to '/login' unless current_user
  end

   def authenticate_admin!
    redirect_to '/dishes' unless current_user && current_user.admin
  end

  def cart_count
    # User.where(["name = ? and email = ?", "Joe", "joe@example.com"])
# SELECT * FROM users WHERE name = 'Joe' AND email = 'joe@example.com';
  	@cart_count = CartedDish.where("status = ? and session_id = ?", "carted", session.id).count
  end
  helper_method :cart_count
end
