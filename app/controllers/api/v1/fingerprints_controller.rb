class Api::V1::FingerprintsController < ActionController::Base
  def create
    Fingerprint.transaction do
      @employee = Employee.find_by(rut: params[:rut])
      if @employee.blank?
        render :json => {:result => 'not exist'}
      else
      	@fingerprint_old = Fingerprint.find_by(employee_id: @employee.id)
      	if @fingerprint_old.blank?
        	@fingerprint = Fingerprint.create hash_fingerprint: params[:hash_fingerprint], employee_id: @employee.id, id_in_sensor: params[:id_in_sensor]
      		render :json => {:result => 'ok'}
      	else
      		render :json => {:result => 'exist finger'}
      	end
      end
    end
  rescue ActiveRecord::RecordInvalid => exception
    render :json => {:result => 'error'}  
  end
end