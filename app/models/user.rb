class User < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 2 }
  validates :address, presence: true
  validates :phone, presence: true, numericality: { only_integer: true }, length: { is: 10 }	
  validates :state, presence: true
  validates :email, presence: true	
  acts_as_authentic
  has_many:books, :class_name => 'Book', :foreign_key => 'user_id'

  scope :order_by_name_asc, -> { all.order("name ASC") }
  scope :order_by_name_desc, -> { all.order("name DESC") }
  scope :order_by_country_asc, -> { all.order("country ASC") }
  scope :order_by_country_desc, -> { all.order("country DESC") }
  scope :order_by_created, -> { all.order("created_at DESC") }
end
