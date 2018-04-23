class Api::V1::MarksController < ActionController::Base
  require 'sendgrid-ruby'
  include SendGrid
  
  def create
    Mark.transaction do
      @user = Fingerprint.find_by(id_in_sensor: params[:id_in_sensor])
      puts @user.as_json
      @employee = Employee.find(@user.employee_id)
      @type = TypeMark.find(params[:mark][:type_mark_id])

      @schedule = EmployeeSchedule.find_by(employee_id: @user.employee_id)
      if @user.blank?
        render :json => {:result => 'not exist'}     
      else
        @mark = Mark.create latitude: params[:mark][:latitude], 
                            longitude: params[:mark][:longitude], 
                            employee_id: @user.employee_id, 
                            type_mark_id: params[:mark][:type_mark_id], 
                            date_time_mark: params[:mark][:date_time_mark],
                            employee_schedule_id: @schedule.id

        send_email @employee.names, @employee.email, params[:mark][:date_time_mark].to_datetime, @type.name_type 
        render :json => {:result => 'ok'}
      end
    end
  rescue ActiveRecord::RecordInvalid => exception
    render :json => {:result => 'error'}  
  end

  def send_email(name, email, date_time_mark, type_mark)
    puts 'send to '
    puts email
    mail = Mail.new
    mail.from = Email.new(email: 'lestat__x@hotmail.com')
    mail.subject = 'Comprobante de marcación'
    personalization = Personalization.new
    personalization.add_to(Email.new(email: email))
    personalization.add_substitution(Substitution.new(key: '-name-', value: name))
    personalization.add_substitution(Substitution.new(key: '-Fecha-', value: date_time_mark.strftime("%Y-%m-%d")))
    personalization.add_substitution(Substitution.new(key: '-Hora-', value: date_time_mark.strftime("%H:%M:%S")))
    personalization.add_substitution(Substitution.new(key: '-Tipo-', value: type_mark))


    #send_at = (date - 30.minutes).to_datetime.to_i
    #puts "Class #{@alert.notice_time.class}"
    send_at = (DateTime.now).to_datetime.to_i
    personalization.send_at = send_at
    mail.add_personalization(personalization)

    #Select template_id 
    mail.template_id = '0697a5dd-1b08-44da-b680-4f968c7dd53f'

    @API = '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'
    #sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    sg = SendGrid::API.new(api_key: @API)
    
    begin
        response = sg.client.mail._("send").post(request_body: mail.to_json)
    rescue Exception => e
        puts e.message
    end

  end
end

# t.datetime "date_time_mark"
# t.float "latitude"
# t.float "longitude"
# t.bigint "employee_id"
# t.bigint "type_mark_id"
# t.bigint "employee_schedule_id"
