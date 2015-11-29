class Message < ActiveRecord::Base
	attr_accessible :name, :email, :phone, :text

	validates :name, presence: true, length: { minimum: 2, maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence:   true,
	                format:     { with: VALID_EMAIL_REGEX }
	validates :text, presence: true, length: { minimum: 10, maximum: 700 }
end