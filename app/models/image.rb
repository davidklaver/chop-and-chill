class Image < ApplicationRecord
	belongs_to :dish, optional: true
	belongs_to :salad_topping, optional: true
end
