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
