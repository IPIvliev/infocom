class CreateHists < ActiveRecord::Migration
  def change
    create_table :hists do |t|
    	t.integer :request_id
    	t.datetime :date
    	t.integer :status

      t.timestamps
    end
  end
end