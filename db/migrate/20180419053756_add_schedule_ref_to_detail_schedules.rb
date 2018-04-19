class AddScheduleRefToDetailSchedules < ActiveRecord::Migration[5.1]
  def change
    add_reference :detail_schedules, :schedule, foreign_key: true
  end
end
