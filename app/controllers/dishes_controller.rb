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
		@dressings = ["Orange Vinaigrette","Raspberry Vinaigrette","Lemon Poppy Dressing","Creamy Italian","Herbed Vinaigrette","Maple Dijon Dressing","Red Wine Vinaigrette","Balsamic Vinaigrette","Ginger Dressing","Caesar Dressing","Spicy Mayo","Ranch Dressing","Diet Caesar Dressing","Pesto Herbed Vinaigrette Sugar Free","Asian Vinaigrette Fat Free"]
	end

	def new
		@dish = Dish.new
	end

	def create
		@dish = Dish.new(name: params[:name], description: params[:description], price: params[:price], category_id: params[:dish][:category_id])
		
		if @dish.save
			flash[:success] = "You added a new dish!"
			redirect_to "/dishes/#{@dish.id}"
		else
			render 'new.html.erb'
		end
	end

	def edit
		@dish = Dish.find_by(id: params["id"])
	end

	def update
		@dish = Dish.find_by(id: params["id"])
		if @dish.update(
			name: params["name"],
			price: params["price"],
			description: params["description"],
			category_id: params["dish"]["category_id"]
		)
			flash[:success] = "This dish has been updated."
			redirect_to "/dishes/#{@dish.id}"
		else
			render 'edit.html.erb'
		end
	end

	def destroy
		dish = Dish.find_by(id: params["id"])
		dish.destroy
		flash[:danger] = "You deleted a dish!"
		redirect_to "/dishes"
	end
end
