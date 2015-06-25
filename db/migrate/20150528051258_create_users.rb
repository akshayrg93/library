class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :phone
      t.string :state
      t.string :country

      t.timestamps null: false
    end
    create_table :books do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.string :author
      t.string :language
      t.string :details
      t.string :user_id
      t.timestamps null: false
    end
  end
end
