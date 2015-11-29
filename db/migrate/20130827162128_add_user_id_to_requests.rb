class AddUserIdToRequests < ActiveRecord::Migration
  def change
  	add_column :requests, :manager_id, :integer
  end
end
