class WeatherReading < ActiveRecord::Base
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
end
