require 'open-uri'
require 'json'
require 'date'

API_KEY = '9ec4600f0f75d514758d614600522388'
BASE_URL = 'https://api.forecast.io/forecast'

# Rainfall Amount (in mm) 
# Current Temperature
# Dew Point
# Wind Direction (if present) 
# Wind Speed (in km/h if present)
#forecast = JSON.parse(forecast)
#temperature: Degrees Celsius.

def current_date(f)
	unix_date = f["currently"]["time"]
	date = DateTime.strptime("#{unix_date}",'%s')
	return date.strftime("%Y-%m-%d")
end

def current_time(f)
	unix_time = f["currently"]["time"]
	time = DateTime.strptime("#{unix_time}",'%s')
	return time.strftime("%I:%M %p")
end

def current_temperature(f)
	return f["currently"]["temperature"]
end

def current_dew_point(f)
	return f["currently"]["dewPoint"]
end

#should return bearings instead of degree
def current_wind_direction(f)
	return f["currently"]["windBearing"]
end

#windSpeed: Meters per second.
def current_wind_speed(f)
	return f["currently"]["windSpeed"]
end

def current_rainfall(f)
	return f["currently"]["precipIntensity"]
end

# Persist Reading to database
def save_reading()
	Station.all.each do |x|
		station_id = x.station_id
		lat = x.lat
		long = x.long
		lat_long = "#{lat},#{long}"
		forecast = JSON.parse(open("#{BASE_URL}/#{API_KEY}/#{lat_long}").read)
		r = WeatherReading.new
		r.build_reading(station_id,lat,long,current_date(forecast),current_time(forecast),current_temperature(forecast),current_dew_point(forecast),
			current_wind_direction(forecast),current_wind_speed(forecast),current_rainfall(forecast),"forecast.io")
		#r.save
	end

end
#rails runner bin/scraper/forecastIoJson.rb 

save_reading()