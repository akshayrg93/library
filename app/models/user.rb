class User < ActiveRecord::Base
	validates :name, :address, :email, :phone, :state, :presence => {:message => "empty value found"}
end
