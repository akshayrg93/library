class Book < ActiveRecord::Base
  validates :name, :author, :language, :details, :no_of_copies, presence: true
  validates :no_of_copies, numericality: { only_integer: true }
  belongs_to :user, class_name: 'User', foreign_key: :user_id
end
