class Twitter < ActiveRecord::Base
  attr_accessible :account_id
  belongs_to :user
end
