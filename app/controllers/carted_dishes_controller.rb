class CartedDishesController < ApplicationController
	# before_action :authenticate_user!
  def index
    carted_dishes = CartedDish.where("status = ? and session_id = ?", "carted", session.id)
    session[:cart] = []
    carted_dishes.each do |carted_dish|
    	session[:cart] << carted_dish.id
		end
		if session[:cart].empty?
			flash[:warning] = "Your Cart is empty! Click below to begin ordering."
			redirect_to "/categories"
		end
		@carted_dishes = []
		session[:cart].each do |carted_dish_id|
			@carted_dishes << CartedDish.find_by("status = ? and id = ?", "carted", carted_dish_id)
		end
		
		@subtotal = 0
		
		@carted_dishes.each do |carted_dish|
			@subtotal += carted_dish.price * carted_dish.quantity
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

		dish = Dish.find(params["dish_id"])
		#start price off as base dish price
		price = dish.price

		#additions for Create Your Own salad
		salad_ingredient_names = ""
		salad_topping_names = ""

		if dish.name == "Create Your Own"
			if params[:salad_ingredients]
				params[:salad_ingredients].each do |id|
					salad_ingredient_names += (SaladIngredient.find(id).name + ", ")
				end
			end
		end

		#add to base price as needed
		if params[:salad_toppings]
		  params[:salad_toppings].each do |id|
			  price += SaladTopping.find(id).price
			  salad_topping_names += (SaladTopping.find(id).name + ", ")
		  end
		end

		@carted_dish = CartedDish.new(
				status: "carted",
				session_id: session.id,
				dish_id: params["dish_id"],
				quantity: quantity,
				comments: params["comments"],
				price: price,
				toppings: salad_topping_names.chop.chop,
				salad_ingredients: salad_ingredient_names.chop.chop,
				dressing: params[:dressing],
				dressing_placement: params[:dressing_placement],
				salad_mix: params[:salad_mix]
			)
		if @carted_dish.save
		  link = ("<a href=#{url_for(action:'index',controller:'carted_dishes')}>your cart</a>")
			flash[:info] = ("You have added #{@carted_dish.dish.name} to #{link}.")
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
