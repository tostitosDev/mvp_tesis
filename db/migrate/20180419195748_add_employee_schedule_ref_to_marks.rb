class AddEmployeeScheduleRefToMarks < ActiveRecord::Migration[5.1]
  def change
    add_reference :marks, :employee_schedule, foreign_key: true
  end
end
