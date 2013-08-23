class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|

    t.string :name
    t.string :text
    t.integer :user_id
    t.string :picture
    
      t.timestamps
    end
  end
end
