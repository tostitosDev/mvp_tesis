class AddCollationTimeToDetailSchedules < ActiveRecord::Migration[5.1]
  def change
    add_column :detail_schedules, :collation_time, :string
    add_column :detail_schedules, :work_time, :string
  end
end
