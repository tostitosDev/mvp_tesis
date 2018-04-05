class CreateMarks < ActiveRecord::Migration[5.1]
  def change
    create_table :marks do |t|
      t.datetime :date_time_mark
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
