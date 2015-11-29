class Agent < ActiveRecord::Base
  attr_accessible :name, :email, :phone, :director, :sum, :dogovor_date

  validates :name, presence: true
  validates :sum, presence: true
  validates :dogovor_date, presence: true

  has_many :users
  has_many :requests, through: :users
end
