class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :names
      t.string :last_name
      t.string :mother_last_name
      t.string :rut
      t.string :email
      t.string :phone
      t.timestamps
    end
  end
end
