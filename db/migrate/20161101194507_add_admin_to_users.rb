class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, default: false # Users' table, Column name admin, Type boolean (default: false)
  end
end
