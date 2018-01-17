class CreateWeathers < ActiveRecord::Migration[5.1]
  def change
    create_table :weathers do |t|
      t.string :main
      t.string :description
      t.integer :visibility
      t.integer :clouds
      t.references :forecast, foreign_key: true

      t.timestamps
    end
  end
end
