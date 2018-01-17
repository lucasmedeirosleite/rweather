class CreateTemperatures < ActiveRecord::Migration[5.1]
  def change
    create_table :temperatures do |t|
      t.decimal :value
      t.integer :pressure
      t.integer :humidity
      t.decimal :min
      t.decimal :max
      t.references :forecast, foreign_key: true

      t.timestamps
    end
  end
end
