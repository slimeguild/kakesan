# coding: utf-8
require 'spec_helper'

describe Talk do
  before do
    @owner = FactoryGirl.create(:user)
    @participant = FactoryGirl.create(:user)
    @stranger = FactoryGirl.create(:user)
    
    @owner_theme = FactoryGirl.create(:theme, user_id: @owner.id)
    @stranger_theme = FactoryGirl.create(:theme, user_id: @stranger.id)

    @owner_talk_1 =
      FactoryGirl.create(
        :talk,
        theme_id: @owner_theme.id,
        user_id: @stranger.id
      )
    @owner_talk_2 =
      FactoryGirl.create(
        :talk,
        theme_id: @owner_theme.id,
        user_id: @stranger.id,
      )
    @owner_talk_3 =
      FactoryGirl.create(
        :talk,
        theme_id: @owner_theme.id,
        user_id: @stranger.id
      )
    @owner_talk_4 =
      FactoryGirl.create(
        :talk,
        theme_id: @owner_theme.id,
        user_id: @stranger.id
      )
    FactoryGirl.create(
      :chat,
      talk_id: @owner_talk_2.id,
      user_id: @stranger.id
    )
    FactoryGirl.create(
      :chat,
      talk_id: @owner_talk_2.id,
      user_id: @stranger.id
    )
    FactoryGirl.create(
      :chat,
      talk_id: @owner_talk_1.id,
      user_id: @stranger.id
    )
    FactoryGirl.create(
      :chat,
      talk_id: @owner_talk_3.id,
      user_id: @stranger.id
    )
    FactoryGirl.create(
      :chat,
      talk_id: @owner_talk_3.id,
      user_id: @owner.id
    )
    FactoryGirl.create(
      :chat,
      talk_id: @owner_talk_4.id,
      user_id: @stranger.id
    )
    FactoryGirl.create(
      :chat,
      talk_id: @owner_talk_4.id,
      user_id: @owner.id
    )
    FactoryGirl.create(
      :chat,
      talk_id: @owner_talk_4.id,
      user_id: @owner.id
    )

    @participant_talk_1 = 
      FactoryGirl.create(
        :talk,
        theme_id: @stranger_theme.id,
        user_id: @participant.id,
        updated_at: Time.new(2100,1,3)
      )
    @participant_talk_2 = 
      FactoryGirl.create(
        :talk,
        theme_id: @stranger_theme.id,
        user_id: @participant.id,
        updated_at: Time.new(2100,1,1)
      )
    @participant_talk_3 = 
      FactoryGirl.create(
        :talk,
        theme_id: @stranger_theme.id,
        user_id: @participant.id,
        updated_at: Time.new(2100,1,2)
      )
  end

  it 'マイトーク(主催)の並び順' do
    p @owner.hosted_talks.should == [@owner_talk_4, @owner_talk_3, @owner_talk_1, @owner_talk_2]
  end

  it 'マイトーク(参加)の並び順' do
    Talk.entried_by(@participant).to_a.should == [@participant_talk_1, @participant_talk_3, @participant_talk_2]
  end
end