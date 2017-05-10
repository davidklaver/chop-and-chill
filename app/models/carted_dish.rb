class CartedDish < ApplicationRecord
	belongs_to :order, optional: true
	belongs_to :user
	belongs_to :dish

	# 	validate :quantity_cannot_be_greater_than_stock

	# def quantity_cannot_be_greater_than_stock
 #    if product.stock == 0
 #    	errors.add(:stock, "Sorry - this product is out of stock at this time.")
 #    elsif quantity > product.stock
 #      errors.add(:stock, "Sorry - we only have #{product.stock} in stock. Please select a different quantity.")
 # 	 end
 # 	end

	def dish_subtotal
		dish.price * quantity
	end
end
