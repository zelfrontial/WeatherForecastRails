# webScraper
bundle install
rake db:create
rake db:migrate
rake db:seed
rails s
whenever -i
rails generate model WeatherReading station_id:string lat:double long:double rainfall:double temperature:double dew_point:double wind_direction:string wind_speed:double date:string time:string source:string
