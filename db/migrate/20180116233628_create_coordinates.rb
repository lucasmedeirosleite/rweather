# frozen_string_literal: true

class CreateCoordinates < ActiveRecord::Migration[5.1]
  def change
    create_table :coordinates do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.references :city, foreign_key: true

      t.timestamps
    end

    add_index(:coordinates, %i[latitude longitude], unique: true)
  end
end
