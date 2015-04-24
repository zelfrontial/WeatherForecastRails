# webScraper
bundle install
rake db:create
rake db:migrate
rake db:seed
whenever -i
whenever -w
rails s
