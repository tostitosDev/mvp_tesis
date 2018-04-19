class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    Employee.transaction do
      @employee = Employee.create employee_params
      flash[:success] = "Se ha creado exitosamente."
      @schedule = Schedule.last
      @employee_schedule = EmployeeSchedule.create employee_id: @employee.id, schedule_id: @schedule.id
      redirect_to employees_path
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    Employee.transaction do
      @employee = Employee.find(params[:id])
      @employee.update_attributes employee_params
      flash[:success] = "Se ha actualizado exitosamente."
      redirect_to employees_path
    end
  end


  def employee_params
    params.require(:employee).permit(
      :names,
      :last_name,
      :mother_last_name,
      :phone,
      :rut,
      :email
    )
  end
end
