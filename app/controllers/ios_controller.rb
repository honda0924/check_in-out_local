class IosController < ApplicationController
  def new
    @io=Io.new
    @students=Student.where(id: params[:ios_student_id].to_i) if params[:ios_student_id] != ''
    respond_to do |format|
      format.html
      format.json
    end
    # @student = Student.where(:id => )
    # gon.line_token = Rails.application.credentials.line[:channel_token]
  end
  def create
    # @io = Io.new
    # if @io.save
    #   respond_to do |format|
    #     format.html
    #     format.json
    #   end
    
    # end

  end
  def checkin
    message = {
      type: 'text',
      text: '入室しました'
    }
    client = Line::Bot::Client.new { |config|
    config.channel_secret = Rails.application.credentials.line[:channel_secret]
    config.channel_token = Rails.application.credentials.line[:channel_token]
    }
    response = client.push_message('U0d1607fd7ec247b84f52da09b3ab30e1',message)
    puts response
  end
  def checkout
    msgTxt = '退室しました'
    message = {
      type: 'text',
      text: msgTxt
    }
    client = Line::Bot::Client.new { |config|
    config.channel_secret = Rails.application.credentials.line[:channel_secret]
    config.channel_token = Rails.application.credentials.line[:channel_token]
    }
    response = client.push_message('U0d1607fd7ec247b84f52da09b3ab30e1',message)
    puts response
  end

  private
  def ios_params
  end
end
