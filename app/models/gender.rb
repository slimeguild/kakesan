class Gender < ActiveRecord::Base
  MALE = 1
  FEMALE = 2
  attr_accessible :name
  has_many :users
end
