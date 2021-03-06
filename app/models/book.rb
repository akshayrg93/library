class Book < ActiveRecord::Base
  validates :name, :author, :language, :details, presence: true
  validates :price, :presence => true, :if => :for_sale?
  validates :no_of_copies, presence: true, :if => :for_sale?
  validates :price, numericality: { only_integer: true }, :if => :for_sale?
  validates :no_of_copies, numericality: { only_integer: true }, :if => :for_sale?
  
  belongs_to :user, class_name: 'User', foreign_key: :user_id
  
  scope :order_by_name, -> { all.order("name") }
  scope :available_for_lending, -> { where(user_id: nil, purchasable: false ) }
  scope :available_for_selling, -> { where('no_of_copies > 0', purchasable: true) }
  
  def for_sale?
  	purchasable == true
  end
end