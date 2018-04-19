class AddScheduleRefToEmployeeSchedules < ActiveRecord::Migration[5.1]
  def change
    add_reference :employee_schedules, :schedule, foreign_key: true
    add_reference :employee_schedules, :employee, foreign_key: true
  end
end
