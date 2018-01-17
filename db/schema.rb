# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

# rubocop:disable all
ActiveRecord::Schema.define(version: 20_180_117_011_949) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'cities', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'country_id'
    t.index ['country_id'], name: 'index_cities_on_country_id'
  end

  create_table 'coordinates', force: :cascade do |t|
    t.decimal 'latitude'
    t.decimal 'longitude'
    t.bigint 'city_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['city_id'], name: 'index_coordinates_on_city_id'
    t.index %w[latitude longitude], name: 'index_coordinates_on_latitude_and_longitude', unique: true
  end

  create_table 'countries', force: :cascade do |t|
    t.string 'acronym'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['acronym'], name: 'index_countries_on_acronym'
  end

  create_table 'forecasts', force: :cascade do |t|
    t.datetime 'date'
    t.bigint 'city_id'
    t.index ['city_id'], name: 'index_forecasts_on_city_id'
    t.index ['date'], name: 'index_forecasts_on_date'
  end

  create_table 'temperatures', force: :cascade do |t|
    t.decimal 'value'
    t.integer 'pressure'
    t.integer 'humidity'
    t.decimal 'min'
    t.decimal 'max'
    t.bigint 'forecast_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['forecast_id'], name: 'index_temperatures_on_forecast_id'
  end

  create_table 'weathers', force: :cascade do |t|
    t.string 'main'
    t.string 'description'
    t.integer 'visibility'
    t.integer 'clouds'
    t.bigint 'forecast_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['forecast_id'], name: 'index_weathers_on_forecast_id'
  end

  create_table 'winds', force: :cascade do |t|
    t.decimal 'speed'
    t.integer 'direction'
    t.bigint 'forecast_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['forecast_id'], name: 'index_winds_on_forecast_id'
  end

  add_foreign_key 'cities', 'countries'
  add_foreign_key 'coordinates', 'cities'
  add_foreign_key 'forecasts', 'cities'
  add_foreign_key 'temperatures', 'forecasts'
  add_foreign_key 'weathers', 'forecasts'
  add_foreign_key 'winds', 'forecasts'
end
# rubocop:enable all
