class Request < ActiveRecord::Base
	attr_accessible :name, :phone, :address, :who, :text, :email, :user_id, :manager_id

	validates :name, presence: true, length: { maximum: 50 }
	validates :phone, presence: true, length: { maximum: 50 }
	validates :address, presence: true, length: { maximum: 50 }
	validates :who, presence: true, length: { maximum: 50 }
	validates :text, presence: true, length: { maximum: 50 }
	validates :email, presence: true, length: { maximum: 50 }

	belongs_to :user
	belongs_to :manager, :class_name => "User", :foreign_key => 'manager_id'
	has_many :comments
end
