class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string # (Table, Column Name *must be called password_digest, Type)
  end
end
