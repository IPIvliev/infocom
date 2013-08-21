class Post < ActiveRecord::Base
  attr_accessible :name, :text, :picture, :user_id

  belongs_to :user

  mount_uploader :picture, BlogUploader
end
