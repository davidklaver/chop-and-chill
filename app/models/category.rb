class Category < ApplicationRecord
	has_many :dishes
	has_many :subcategories
end
