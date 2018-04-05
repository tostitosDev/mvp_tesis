class AddEmployeeRefToMarks < ActiveRecord::Migration[5.1]
  def change
    add_reference :marks, :employee, foreign_key: true
  end
end
