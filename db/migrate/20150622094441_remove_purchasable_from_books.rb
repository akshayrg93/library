class RemovePurchasableFromBooks < ActiveRecord::Migration
  def change
  	remove_column :books, :purchasable
  end
end
