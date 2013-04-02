class Talk < ActiveRecord::Base
  attr_accessible :user_id, :theme_id, :chats_attributes
  belongs_to :user
  belongs_to :theme
  has_many :chats, order: 'created_at desc'
  accepts_nested_attributes_for :chats
end
