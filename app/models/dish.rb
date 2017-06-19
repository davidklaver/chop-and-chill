class Dish < ApplicationRecord
	has_many :ingredients
	belongs_to :category
	belongs_to :subcategory, optional: true
	has_many :carted_dishes
	has_many :users, through: :carted_dishes

	validates :name, presence: true
	validates :price, :numericality => {:greater_than => 0, :less_than => 1000}

	def tax
		price * 0.0875
	end

	def total
		price + tax
	end
end