require 'nokogiri'
require 'open-uri'
require 'date'
URL = 'http://www.bom.gov.au/vic/observations/melbourne.shtml'

def current_time()
	l_string = doc.css('p')[1].text.split()
	time = l_string[2] + " "
	time += l_string[3]
	time = DateTime.strptime("#{time}",'%l:%M %P')
	return time.strftime("%I:%M %p")
end

def current_date(t)
	l_string = t.css('p')[1].text.split()
	date = l_string[6] + " "
	date += l_string[7] + " "
	date += l_string[8]
	date = DateTime.strptime("#{date}",'%e %B %Y')
	return date.strftime("%Y-%m-%d")
end

def current_temperature(t,location)
	tag = 'obs-apptemp '
	tag += location
	return t.css("td[headers = '#{tag}']").text
end

def rainfall_ammount(t,location)
	tag = 'obs-rainsince9am '
	tag += location
	return t.css("td[headers = '#{tag}']").text
end

def dew_point(t,location)
	tag = 'obs-dewpoint '
	tag += location
	return t.css("td[headers = '#{tag}']").text
end

def wind_direction(t,location)
	tag = 'obs-wind obs-wind-dir '
	tag += location
	return t.css("td[headers = '#{tag}']").text
end

def wind_speed(t,location)
	tag = 'obs-wind obs-wind-spd-kph '
	tag += location
	return t.css("td[headers = '#{tag}']").text
end

def save_reading()
	
	doc = Nokogiri::HTML(open(URL))
	table = doc.at('tbody')

	Station.all.each do |x|
		station_id = x.station_id
		lat = x.lat
		long = x.long
		#puts table,x
		r = WeatherReading.new
		r.build_reading(station_id,lat,long,current_date(table,x),current_time(table,x),current_temperature(table,x),current_dew_point(table,x),
			current_wind_direction(table,x),current_wind_speed(table,x),current_rainfall(table,x),"BOM")
		#r.save
		puts r
	end

end

save_reading()
#puts current_temperature(table,'obs-station-melbourne-olympic-park')
