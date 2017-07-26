class SaladIngredientsController < ApplicationController
	def index
		@salad_ingredients = SaladIngredient.all
	end
end
