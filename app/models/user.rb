class User < ActiveRecord::Base
	validates :name, presence: true, length: { minimum: 2 }
	validates :address, presence: true
	validates :phone, presence: true, numericality: { only_integer: true }, length: { is: 10 }	
	validates :state, presence: true
	validates :email, presence: true	
	acts_as_authentic
	has_many:book, :class_name => 'Book', :foreign_key => 'user_id'
end
