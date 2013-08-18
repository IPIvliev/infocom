class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    t.string   :name
    t.string   :email
    t.string   :password_digest
    t.string   :remember_token
    t.boolean  :admin,           :default => false
    t.boolean  :manager,         :default => false
    t.string   :address
    t.string   :phone
    t.integer  :agent_id

      t.timestamps
    end
  end
end
