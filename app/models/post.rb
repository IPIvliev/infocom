class Post < ActiveRecord::Base
  attr_accessible :name, :text, :picture, :user_id

  	validates :name, presence: true
	validates :text, presence: true

  belongs_to :user

  mount_uploader :picture, BlogUploader
end
