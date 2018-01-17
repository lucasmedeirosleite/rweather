# frozen_string_literal: true

class CreateForecasts < ActiveRecord::Migration[5.1]
  def change
    create_table :forecasts do |t|
      t.datetime :date, index: true
      t.references :city, foreign_key: true
    end
  end
end
