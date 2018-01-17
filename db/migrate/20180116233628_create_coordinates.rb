class CreateCoordinates < ActiveRecord::Migration[5.1]
  def change
    create_table :coordinates do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.references :city, foreign_key: true

      t.timestamps
    end

    add_index(:coordinates, [:latitude, :longitude], unique: true)
  end
end
