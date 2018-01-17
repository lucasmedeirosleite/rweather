# frozen_string_literal: true

class AddCountryToCities < ActiveRecord::Migration[5.1]
  def change
    add_reference :cities, :country, foreign_key: true
  end
end
