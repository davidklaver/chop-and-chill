class PagesController < ApplicationController
	def index
		@current_page = "index"
		@categories = Category.all
		@dishes = Dish.all
	end
end
