class CreateFingerprints < ActiveRecord::Migration[5.1]
  def change
    create_table :fingerprints do |t|
      t.string :hash_fingerprint
      t.timestamps
    end
  end
end
