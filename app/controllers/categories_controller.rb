class CategoriesController < ApplicationController
	def index
		@current_page = "categories"
		@categories = Category.all
	end

	def show
		@categories = Category.all
		@category = Category.find(params[:id])
	end
end
