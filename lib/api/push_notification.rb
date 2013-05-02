# coding: utf-8
module API
  class PushNotification
    attr_accessor :pusher, :user
    
    def initialize(user)
      # sandbox: "gateway.sandbox.push.apple.com"
      # distribution: "gateway.push.apple.com"
      @pusher = Grocer.pusher(
        certificate: "lib/apns/apns_development.pem", 
        passphrase:  "koming36I",
        gateway:     "gateway.sandbox.push.apple.com",
        port:        2195,
        retries:     3
      )
      @user = user
    end

    def chat_received(chat)
      notification = Grocer::Notification.new(
        device_token: @user.iOS.token, 
        alert: "#{chat.user.nickname}さんから「#{chat.talk.theme.title}が好き」についてメッセージが届きました。",
        badge: 1,
        sound: '',
        expiry: Time.now + 60*60
      )
      @pusher.push(notification)
      Rails.logger.info '--- chat received ---'
      Rails.logger.info notification
    end
  end
end