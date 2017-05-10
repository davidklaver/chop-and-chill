class Subcategory < ApplicationRecord
	has_many :dishes
	belongs_to :category, optional: true
end
