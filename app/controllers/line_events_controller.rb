class LineEventsController < ApplicationController
    require 'line/bot'
    def client
        @client ||= Line::Bot::Client.new { |config|
          config.channel_secret = "d6d08cedfee7051debd7f09f323ddc91"
          config.channel_token = "jcUJUDGWVYnU9A3TkQpAjI2G0TCKK7KmMrNr8892E2rROrInXE8SjdpqgG2s0qtwuiYIy7OAjMpG/TSrsxSIj9KjCm0tN8dBN4malFiwllttN6k3ZTqQ3nJLkTtKHbo0wr4o8xgMEQJrgy6lPQ0EkQdB04t89/1O/w1cDnyilFU="
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
              # Message.create(
              #   user_uid: userId, 
              #   replyToken: event['replyToken'],  
              #   message_id: event['message']['id'], 
              #   message_type: event['message']['type'], 
              #   message_text: event['message']['text']
              #  )
              puts event['message']['text']
            end
          end
        }

    end

end
