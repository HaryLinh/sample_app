source "https://rubygems.org"
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "image_processing", "1.9.3"
gem "mini_magick", "4.9.5"
gem "active_storage_validations", "0.8.2"
gem "figaro"
gem "kaminari"
gem "bootstrap-kaminari-views"
gem "faker", "1.7.3"
gem "jquery-rails", "4.3.1"
gem "bcrypt", "3.1.13"
gem "config"
gem "rails-i18n"
gem "rails", "~> 5.2.0"
gem "sqlite3"
gem "puma", "~> 3.7"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "mysql2", "~> 0.5.3"
gem "bootsnap", ">= 1.1.0", require: false
gem "bootstrap-sass", "3.4.1"
gem "sassc-rails", ">= 2.1.0"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
