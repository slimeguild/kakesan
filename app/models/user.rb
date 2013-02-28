class User < ActiveRecord::Base
  attr_accessible :name, :nickname, :image, :description
  has_one  :twitter, dependent: :destroy
  has_many :events , dependent: :destroy
  has_many :entries, dependent: :destroy
end
