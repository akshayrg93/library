class User < ActiveRecord::Base
	validates :name, :address, :email, :phone, :state, :presence => {:message => "empty value found"}
	has_many:book, :class_name => 'Book', :foreign_key => 'user_id'
	
end
