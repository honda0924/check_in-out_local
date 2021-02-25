class IosController < ApplicationController
  def new
    @io=Io.new
    @students=Student.where(id: params[:ios_student_id].to_i) if params[:ios_student_id] != ''
    respond_to do |format|
      format.html
      format.json
    end

  end

  def checkin
    @student = Student.find(params[:io][:student_id])
    @lineuser = Lineuser.where(student_id: params[:io][:student_id]).first
    @iostate = Iostate.where(student_id: params[:io][:student_id]).first
    
    
    msgText = "#{@student.student_name}さんが#{set_time}に入室しました。"
    message = {
      type: 'text',
      text: msgText
    }

    Io.transaction do
      
      @io = Io.create!(ios_checkin_params)
      if @iostate
        @iostate.update!(state_checkin_params)
      else
        Iostate.create!(state_checkin_params)
      end
      

      client = Line::Bot::Client.new { |config|
      config.channel_secret = Rails.application.credentials.line[:channel_secret]
      config.channel_token = Rails.application.credentials.line[:channel_token]
      }
      response = client.push_message(@lineuser.line_uid,message)
      puts response

      redirect_to new_io_path

    end

  end

  def checkout
    
    @student = Student.find(params[:io][:student_id])
    @lineuser = Lineuser.where(student_id: params[:io][:student_id]).first
    @iostate = Iostate.where(student_id: params[:io][:student_id]).first

    
    msgTxt = "#{@student.student_name}さんが#{set_time}に退室しました。"
    message = {
      type: 'text',
      text: msgTxt
    }
    Io.transaction do
      @io = Io.create!(ios_checkout_params)
      if @iostate
        @iostate.update!(state_checkout_params)
      else
        @iostate.create!(state_checkout_params)
      end
      client = Line::Bot::Client.new { |config|
      config.channel_secret = Rails.application.credentials.line[:channel_secret]
      config.channel_token = Rails.application.credentials.line[:channel_token]
      }
      response = client.push_message(@lineuser.line_uid,message)
      puts response

      redirect_to new_io_path

    end

  end

  private
  def set_time
    now_date = Time.now
    return now_date.strftime("%H:%M")
  end

  def ios_checkin_params
    params.permit.merge(student_id: params[:io][:student_id] ,in_time: Time.now)
  end
  def ios_checkout_params
    params.permit.merge(student_id: params[:io][:student_id] ,out_time: Time.now)
  end
  def state_checkin_params
    params.permit.merge(student_id: params[:io][:student_id], iostat: 1)
  end
  def state_checkout_params
    params.permit.merge(student_id: params[:io][:student_id], iostat: 0)
  end
end
