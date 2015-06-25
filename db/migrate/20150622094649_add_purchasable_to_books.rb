class AddPurchasableToBooks < ActiveRecord::Migration
  def change
    add_column :books, :purchasable, :boolean
  end
end
