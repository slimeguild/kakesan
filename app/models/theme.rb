# coding: utf-8
class Theme < ActiveRecord::Base
  TITLE_MAX_LENGTH = 9
  DESCRIPTION_MAX_LENGTH = 256
  PER_PAGE = 10
  
  attr_accessible :user_id, :title, :description, :requirements_attributes
  
  belongs_to :user
  has_many :requirements, dependent: :destroy
  has_many :talks, dependent: :destroy

  accepts_nested_attributes_for :requirements

  scope :newly, order('created_at desc')
  validates :title, presence: true, length: {maximum: TITLE_MAX_LENGTH}
  validates :description, length: {maximum: DESCRIPTION_MAX_LENGTH}

  def custom_title
    self.title + 'が好き'
  end

  def build_requirements
    (Requirement::MAX_NUM - self.requirements.count).times{self.requirements.build}
  end

end
