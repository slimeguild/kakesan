module ApplicationHelper
  def twitter_like_time(time)
    if time < 1.days.ago
      time.strftime("%Y/%m/%d %H:%M") 
    else
      time_ago_in_words(time) + t('datetime.ago')
    end
  end
end
