class User < ActiveRecord::Base
  attr_accessible :name, :nickname, :image
  has_one :twitter, dependent: :destroy
end
