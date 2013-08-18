class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
    	t.string :name
    	t.string :email
    	t.string :phone
    	t.string :address
    	t.string :who
    	t.string :text
    	t.boolean :finish, default: false

      t.timestamps
    end
  end
end
