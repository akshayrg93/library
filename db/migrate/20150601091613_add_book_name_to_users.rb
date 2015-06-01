class AddBookNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :book_name, :string
  end
end
