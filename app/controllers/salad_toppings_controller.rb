class SaladToppingsController < ApplicationController
	def index
		@salad_toppings = SaladTopping.all
	end
end
