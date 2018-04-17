class Api::V1::FingerprintsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    Fingerprint.transaction do
      @employee = Employee.find_by(rut: params[:rut])
      @fingerprint = Fingerprint.create hash_fingerprint: params[:hash_fingerprint], employee_id: @employee_id.id, id_in_sensor: params[:id_in_sensor]
      render :json => {:result => 'ok'}
    end
  rescue ActiveRecord::RecordInvalid => exception
    render :json => {:result => 'error'}  
  end
end