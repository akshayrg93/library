class AddBookCountToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :book_count, :integer, :default => 0
  end
end
