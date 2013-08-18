class Agent < ActiveRecord::Base
  attr_accessible :name, :email, :phone, :director, :sum, :dogovor_date

  has_many :users
end
