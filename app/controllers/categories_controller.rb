class CategoriesController < ApplicationController
	# before_action :authenticate_user!
	def index
		@current_page = "categories"
		@categories = Category.all
		p "*" * 50
		p "here's sessioncart in categories:"
		p session[:cart]
		p "*" * 50
	end

	def show
		@categories = Category.all
		@category = Category.find(params[:id])
		@dressings = ["Orange Vinaigrette","Raspberry Vinaigrette","Lemon Poppy Dressing","Creamy Italian","Herbed Vinaigrette","Maple Dijon Dressing","Red Wine Vinaigrette","Balsamic Vinaigrette","Ginger Dressing","Caesar Dressing","Spicy Mayo","Ranch Dressing","Diet Caesar Dressing","Pesto Herbed Vinaigrette Sugar Free","Asian Vinaigrette Fat Free"]
	end
end
