class AddEmployeeRefToFingerprints < ActiveRecord::Migration[5.1]
  def change
    add_reference :fingerprints, :employee, foreign_key: true
  end
end
