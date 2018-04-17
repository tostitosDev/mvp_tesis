class AddStatusToMarks < ActiveRecord::Migration[5.1]
  def change
    add_column :marks, :aasm_state, :string
  end
end
