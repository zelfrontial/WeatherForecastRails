class CreateWeatherReadings < ActiveRecord::Migration
  def change
    create_table :weather_readings do |t|
      t.string :station_id
      t.double :lat
      t.double :long
      t.double :rainfall
      t.double :temperature
      t.double :dew_point
      t.string :wind_direction
      t.double :wind_speed
      t.string :date
      t.string :time
      t.string :source

      t.timestamps null: false
    end
  end
end
