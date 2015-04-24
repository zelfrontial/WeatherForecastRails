# webScraper
Student Id = 613726 
Login Id = dthamrin

bundle install
rake db:create
rake db:migrate
rake db:seed
#if you want to populate data
rails runner lib/scraper/forecastIoJson.rb 
rails runner lib/scraper/bomScraper.rb 
whenever -i
whenever -w
rails s
