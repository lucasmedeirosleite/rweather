class CreateWinds < ActiveRecord::Migration[5.1]
  def change
    create_table :winds do |t|
      t.decimal :speed
      t.integer :direction
      t.references :forecast, foreign_key: true

      t.timestamps
    end
  end
end
