class Book < ActiveRecord::Base
  validates :name, :author, :language, :details, presence: true
  belongs_to :user, class_name: 'User', foreign_key: :user_id
end
