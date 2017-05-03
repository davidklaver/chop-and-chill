class DishesController < ApplicationController
	def index
		@dishes = Dish.all
		@current_page = "dishes"
	end
end
