require 'nokogiri'
require 'open-uri'
URL = 'http://www.bom.gov.au/vic/observations/melbourne.shtml'

#gets all the table element
#puts table.css('td')
#gets the station name
def station_name_arr(t)
	return t.css('th').map{|x| x['id']}
end
#puts table.css('th')[0]['id']


# Rainfall Amount (in mm) 
# Current Temperature
# Dew Point
# Wind Direction (if present) 
# Wind Speed (in km/h if present)
###page.css("li[data-category='news']")
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

def weather_data()
	
	doc = Nokogiri::HTML(open(URL))
	table = doc.at('tbody')
	list_station = station_name_arr(table)
	return list_staion.map{|x| }
end
#puts current_temperature(table,'obs-station-melbourne-olympic-park')
