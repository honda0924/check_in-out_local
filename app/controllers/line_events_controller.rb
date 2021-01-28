class LineEventsController < ApplicationController
    require 'line/bot'
    def client
        @client ||= Line::Bot::Client.new { |config|
          config.channel_secret = Rails.application.credentials.line[:channel_secret]
          config.channel_token = Rails.application.credentials.line[:channel_token]
        }
    end
    def receive
        body = request.body.read
        events = client.parse_events_from(body)
        events.each { |event|
          userId = event['source']['userId']  #userId取得
          p 'UserID: ' + userId # UserIdを確認
          case event
          when Line::Bot::Event::Message # Messageの場合
            case event['type']
            when 'message'
              Message.create(
                user_uid: userId, 
                replyToken: event['replyToken'],  
                message_id: event['message']['id'], 
                message_type: event['message']['type'], 
                message_text: event['message']['text']
               )
              puts event['message']['text']
            end
          end
        }

    end

end
