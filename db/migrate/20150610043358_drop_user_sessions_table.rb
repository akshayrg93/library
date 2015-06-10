class DropUserSessionsTable < ActiveRecord::Migration
   def up
    drop_table :user_sessions
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
