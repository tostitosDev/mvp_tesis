class AddTypeMarkRefToMarks < ActiveRecord::Migration[5.1]
  def change
    add_reference :marks, :type_mark, foreign_key: true
  end
end
