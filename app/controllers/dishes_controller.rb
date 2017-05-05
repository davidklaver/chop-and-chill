class DishesController < ApplicationController
	before_filter :set_current_page
	def set_current_page
	  @current_page = "dishes"
	end
	def index
		@dishes = Dish.all
		@sundaes = Dish.where(category: "Sundaes")
	end

	def show
		@dish = Dish.find(params[:id])
	end

	def new
		@dish = Dish.new
	end

	def create
		@dish = Dish.new(name: params[:name], description: params[:description], price: params[:price], category: params[:category])
		
		if @dish.save
			# flash[:success] = "You added a new product!"
			redirect_to "/dishes/#{@dish.id}"
		else
			render 'new.html.erb'
		end
	end
end
