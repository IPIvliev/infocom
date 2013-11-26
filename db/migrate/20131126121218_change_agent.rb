class ChangeAgent < ActiveRecord::Migration
  def change
  	remove_column :agents, :director
  	add_column :agents, :fax, :string
  	add_column :agents, :dealer, :string
  	add_column :agents, :dealer_phone, :string
  	add_column :agents, :dealer_email, :string
  end
end
