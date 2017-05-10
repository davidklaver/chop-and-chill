class User < ApplicationRecord
	has_secure_password
	has_many :carted_dishes
	has_many :products, through: :carted_dishes
	has_many :orders

	validates :name, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
	validates_format_of :email, :with => /@/
	validates :password, length: { minimum: 6 }
end
