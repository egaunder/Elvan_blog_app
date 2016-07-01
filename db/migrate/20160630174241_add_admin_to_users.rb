class AddAdminToUsers < ActiveRecord::Migration
  #add column to users table with admin as column name, boolean as column type and have default
  #value of false
  def change
    add_column :users, :admin, :boolean, default: false
  end
end
