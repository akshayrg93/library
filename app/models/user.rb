class User < ActiveRecord::Base
	validates :name, presence: true, length: { minimum: 2 }
	validates :address, presence: true	
	validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
	validates :phone, presence: true, numericality: { only_integer: true }, length: { is: 10 }	
	validates :state, presence: true	
	has_many:book, :class_name => 'Book', :foreign_key => 'user_id'
end
