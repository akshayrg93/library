class Book < ActiveRecord::Base
	validates :name, :author, :language, :details, :presence => {:message => "empty value found"}
	belongs_to :user, class_name: 'User', foreign_key: :user_id
end
