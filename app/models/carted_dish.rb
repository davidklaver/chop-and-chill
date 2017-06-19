class CartedDish < ApplicationRecord
	belongs_to :order, optional: true
	belongs_to :user, optional: true
	belongs_to :dish

	def dish_subtotal
		dish.price * quantity
	end
end
