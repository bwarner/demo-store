# Steps to setup demo 
# setup RVM
  - rvm gemset create store
  - echo ruby-2.7.1@store > .ruby-version
# Generate app
  -  gem install rails
  -  rails new store -d postgresql --no-skip-action-mailer   
  -  rails generate scaffold Post name:string title:string content:text\n
  -  rails generate controller home index

## set / route
```
Rails.application.routes.draw do
  root to: 'home#index'
  get 'home/index'
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
```

# Build Image
  659  docker build -t store:1.0  .

# Command to interact with containers
## Show app logs
```
  docker logs store_app_1
```

##  Connect to instance
```
  docker exec -it store_app_1  /bin/sh
```
