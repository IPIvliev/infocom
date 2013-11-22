class Comment < ActiveRecord::Base
  attr_accessible :request_id, :text, :user_id

	validates :text, presence: true, length: { minimum: 2, maximum: 300 }
	
  belongs_to :user
  belongs_to :request


end
