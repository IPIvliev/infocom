class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
    
    t.string :name
    t.string :email
    t.date :dogovor_date
    t.integer :sum
    t.string :director
    t.string :phone

    t.timestamps
    end
  end
end
