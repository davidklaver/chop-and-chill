class CartedDishesController < ApplicationController
	# before_action :authenticate_user!
	def index
		@carted_dishes = CartedDish.where("status = ? and session_id = ?", "carted", session.id)
		if @carted_dishes.count == 0
			flash[:warning] = "Your Cart is empty! Click below to begin ordering."
			redirect_to "/categories"
		end
		@subtotal = 0
		@carted_dishes.each do |carted_dish|
			@subtotal += carted_dish.dish_subtotal
		end
		@tax = @subtotal * 0.0875
		@total = @subtotal + @tax
	end

	def create
		if params[:quantity] == nil
			quantity = 1
		else
			quantity = params["quantity"]
		end
		@carted_dish = CartedDish.new(
				status: "carted",
				session_id: session.id,
				dish_id: params["dish_id"],
				quantity: quantity

			)
		if @carted_dish.save
			flash[:success] = "You have added #{@carted_dish.dish.name} to your cart."
			redirect_to "/categories"
		else
			@dish = Dish.find(params["dish_id"])
			render "/dishes/show.html.erb"
		end
	end

	def destroy
		carted_dish = CartedDish.find(params["id"])
		carted_dish.update(status: "removed")
		flash[:warning] = "You have removed #{carted_dish.dish.name} from your cart."
		redirect_to "/carted_dishes"
	end
end
