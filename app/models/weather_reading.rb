class WeatherReading < ActiveRecord::Base

   # t.string :station_id
   #    t.double :lat
   #    t.double :long
   #    t.double :rainfall
   #    t.double :temperature
   #    t.double :dew_point
   #    t.string :wind_direction
   #    t.double :wind_speed
   #    t.string :date
   #    t.string :time
   #    t.string :source
	def build_reading(station_id,lat,long,date,time,temperature,dew_point,
		wind_direction,wind_speed,rainfall,source)
		w = WeatherReading.new
		w.station_id = station_id
		w.lat = lat
		w.long = long
		w.date = date
		w. time = time
		w.temperature = temperature
		w.dew_point = dew_point
		w.wind_direction = wind_direction
		w.wind_speed = wind_speed
		w.rainfall = rainfall
		w.source = source
		return w
	end

	def yolo()
		puts "yoloswag"
	end

end
