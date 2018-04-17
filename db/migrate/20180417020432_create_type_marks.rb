class CreateTypeMarks < ActiveRecord::Migration[5.1]
  def change
    create_table :type_marks do |t|
      t.string :name_type
      t.timestamps
    end
  end
end
