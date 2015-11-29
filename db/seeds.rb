#encoding: utf-8 

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' } { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel' city: cities.first)

agent = Agent.create( :name => 'ООО Инфоком-НН' )
User.create( :name => 'Кирилл Белов', :email => 'cccp1945@mail.ru',  :password => '1qaz!QAZ', :password_confirmation => '1qaz!QAZ', :admin => true, :manager => false, :address => 'пл. Сенная', :phone => '8-906-675-5645', :agent_id => agent.id )