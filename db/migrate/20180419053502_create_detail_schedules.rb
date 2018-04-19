class CreateDetailSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :detail_schedules do |t|
      t.string :day
      t.time :time_in
      t.time :time_out_collation
      t.time :time_in_collation
      t.time :time_out
      t.timestamps
    end
  end
end
