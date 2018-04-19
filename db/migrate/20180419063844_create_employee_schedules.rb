class CreateEmployeeSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_schedules do |t|

      t.timestamps
    end
  end
end
