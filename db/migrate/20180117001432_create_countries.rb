# frozen_string_literal: true

class CreateCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :countries do |t|
      t.string :acronym, index: true, unique: true
      t.timestamps
    end
  end
end
