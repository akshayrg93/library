class AddNoOfCopiesToBooks < ActiveRecord::Migration
  def change
    add_column :books, :no_of_copies, :integer
  end
end
