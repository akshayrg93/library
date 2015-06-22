class ChangePurchasableInBooks < ActiveRecord::Migration
  def change
  	change_column :books, :purchasable, :boolean, :default => false
  end
end
