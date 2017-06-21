class PagesController < ApplicationController
	def index
		@current_page = "index"
		@categories = Category.all
		@dishes = Dish.all
		#take this out once you see heroku works!!!
		session[:cart] = []
	end
end
