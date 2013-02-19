class Event < ActiveRecord::Base
  KAKESAN_MAX_LENGTH = 12
  DESCRIPTION_MAX_LENGTH = 256
  PER_PAGE = 10
  
  attr_accessible :user_id, :where, :who, :what, :description
  
  belongs_to :user
  has_many   :entries, dependent: :destroy
  has_many   :users, through: :entries
  has_many   :comments, order: 'created_at desc'
  scope :newly, order('created_at desc')
  scope :entried_by, lambda{|user| joins(:entries).where('entries.user_id = ?', user.id).order('entries.created_at desc')}
  validates :where, presence: true, length: {maximum: KAKESAN_MAX_LENGTH}
  validates :who, presence: true, length: {maximum: KAKESAN_MAX_LENGTH}
  validates :what, presence: true, length: {maximum: KAKESAN_MAX_LENGTH}
  validates :description, length: {maximum: DESCRIPTION_MAX_LENGTH}
end
