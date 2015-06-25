class RenameCategoryInBooksToPurchasable < ActiveRecord::Migration
  def change
  	rename_column :books, :category, :purchasable
  end
end
