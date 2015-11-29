class AddFinishToRequests < ActiveRecord::Migration
  def change
  	remove_column :requests, :finish
  	add_column :requests, :finish, :integer, :default => 0
  end
end
