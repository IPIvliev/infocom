class Post < ActiveRecord::Base
  attr_accessible :name, :text

  belongs_to :user
end
