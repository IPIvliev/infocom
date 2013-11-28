class Hist < ActiveRecord::Base
  attr_accessible :request_id, :date, :status

  belongs_to :request
end
