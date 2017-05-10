class DishesController < ApplicationController
	before_action :authenticate_admin!, only: [:create, :update, :destroy, :new, :edit]
	# before_action :authenticate_user!
	before_filter :set_current_page
	def set_current_page
	  @current_page = "dishes"
	end

	def index
		@dishes = Dish.all
		@categories = Category.all
		@subcategories = Subcategory.all
	end

	def show
		@dish = Dish.find(params[:id])
	end

	def new
		@dish = Dish.new
	end

	def create
		@dish = Dish.new(name: params[:name], description: params[:description], price: params[:price].to_i, category_id: params[:category_id].to_i)
		
		if @dish.save
			flash[:success] = "You added a new product!"
			redirect_to "/dishes/#{@dish.id}"
		else
			render 'new.html.erb'
		end
	end
end
