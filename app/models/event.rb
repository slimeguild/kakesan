class Event < ActiveRecord::Base
  attr_accessible :user_id, :where, :who, :what, :description
  belongs_to :user
end
