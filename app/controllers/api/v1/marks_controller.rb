class Api::V1::MarksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    Mark.transaction do
      @user = Fingerprint.find_by(id_in_sensor: params[:id_in_sensor])
      if @user.blank?
        render :json => {:result => 'no_fingerprint'}
      else
        @mark = Mark.create latitude: params[:latitude], longitude: params[:longitude], employee_id: @user.employee_id, type_mark_id: params[:type_mark_id], date_time_mark: params[:date_time_mark]
        render :json => {:result => 'ok'}
      end
    end
  rescue ActiveRecord::RecordInvalid => exception
    render :json => {:result => 'error'}  
  end
end

# t.datetime "date_time_mark"
# t.float "latitude"
# t.float "longitude"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.bigint "employee_id"
# t.string "aasm_state"
# t.index ["employee_id"], name: "index_marks_on_employee_id"