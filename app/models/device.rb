class Device < ActiveRecord::Base
  attr_accessible :user_id, :token, :type
  belongs_to :user
end
