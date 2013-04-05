class Talk < ActiveRecord::Base
  PER_PAGE = 10
  attr_accessible :user_id, :theme_id, :chats_attributes
  belongs_to :user
  belongs_to :theme
  has_many :chats, order: 'created_at desc'
  accepts_nested_attributes_for :chats

  scope :newly, order('updated_at desc')
  scope :hosted_by, lambda{|user| joins(:theme).where('themes.user_id = ?', user.id).newly}
  scope :message_sended_by, lambda{|user| joins(:chats).where('chats.user_id = ?', user.id).newly.uniq}
  scope :entried_by, lambda{|user| where(user_id: user.id).newly}
end
