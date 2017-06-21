class Order < ApplicationRecord
	# belongs_to :user
  has_many :carted_dishes
  has_many :dishes, through: :carted_dishes

  def pretty_time
  		created_at.strftime("%A, %b %d")
	end

	def order_subtotal
		subtotal = 0
		carted_dishes.each do |carted_dish|
			subtotal += carted_dish.dish.price * carted_dish.quantity
		end
		subtotal
	end

	def order_tax
		tax = order_subtotal * 0.0875
		tax
	end

	def order_total
		total = order_subtotal + order_tax
		total
	end
	
end
