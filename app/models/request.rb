class Request < ActiveRecord::Base
	attr_accessible :name, :phone, :address, :who, :text, :email

	validates :name, presence: true, length: { maximum: 50 }
	validates :phone, presence: true, length: { maximum: 50 }
	validates :address, presence: true, length: { maximum: 50 }
	validates :who, presence: true, length: { maximum: 50 }
	validates :text, presence: true, length: { maximum: 50 }
	validates :email, presence: true, length: { maximum: 50 }

	belongs_to :user
	belongs_to :agent
end
