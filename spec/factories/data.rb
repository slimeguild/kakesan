# coding: utf-8
FactoryGirl.define do
  factory :user do
    sequence(:id) {|n| n}
    sequence(:nickname) {|n| "User#{n}"}
  end

  factory :theme do
    user_id 1
    title 'title'
  end

  factory :talk do
    user_id 1
    theme_id 1
  end

  factory :chat do
    user_id 1
    talk_id 1
    message 'message'
  end   
end







