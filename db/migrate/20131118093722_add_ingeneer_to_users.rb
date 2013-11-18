class AddIngeneerToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :status, :integer, :default => 0
  	remove_column :users, :admin
  	remove_column :users, :manager
  end
end
