class AddIdInSensorToFingerprints < ActiveRecord::Migration[5.1]
  def change
    add_column :fingerprints, :id_in_sensor, :integer
  end
end
