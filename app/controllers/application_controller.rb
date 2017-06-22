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
  	@cart_count = session[:cart].count
  end
  helper_method :cart_count

  # def session_cart
  #   @session_cart ||= []
  # end
  # helper_method :session_cart
end
