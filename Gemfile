source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby "3.0.0"
gem "rails"
gem "puma", "~> 5.0"
gem "sass-rails", ">= 6"
gem "webpacker", "~> 5.0"
gem "turbolinks", "~> 5"
gem "jbuilder"
gem "bootsnap", require: false
gem "bcrypt", "~> 3.1.7"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
#Gemfile
gem "devise", "~> 4.1"
gem "slim"
gem "rails-i18n"
gem "omniauth"
gem "omniauth-google-oauth2"
gem "omniauth-facebook"
gem "sidekiq"
gem "whenever"
gem "kaminari"   
gem "ransack"     
gem "bootstrap-kaminari-views"
gem "pry-rails", :group => :development


group :development, :test do
  gem "sqlite3", "1.4"
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console","4.0.1"
  
  gem "listen"
  
  gem "spring","2.1.0"
  
  gem "spring-watcher-listen", "2.0.1"
end

group :production do
  gem "pg"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara","3.28.0"

  gem "selenium-webdriver","3.142.4"

  gem "webdrivers","4.1.2"

  gem "rails-controller-testing", "1.0.4"

  gem "minitest","5.18.0"

  gem "minitest-reporters","1.3.8"

  gem "guard","2.15.0"

  gem "guard-minitest","2.4.6"
end
