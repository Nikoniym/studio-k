source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'letter_opener'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'nokogiri', '~> 1.8', '>= 1.8.2'
gem 'yui-compressor', '~> 0.12.0'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'slim', '~> 3.0', '>= 3.0.7'
gem 'activesupport'
gem 'paperclip', '~> 5.2', '>= 5.2.1'
gem 'papercrop', '~> 0.3.0'
gem 'devise'
gem 'activeadmin', '~> 1.0.0.pre5'
gem 'susy'
gem 'compass-rails', '~> 3.0', '>= 3.0.2'
gem 'light_gallery_rails'
gem 'pg', '~> 0.21.0'
gem 'dropzonejs-rails'
gem 'cancancan'
gem 'rolify'
gem 'filterrific'
gem 'bootstrap', '~> 4.0.0.alpha6'
gem 'jquery-ui-rails'
gem 'will_paginate'
gem 'will_paginate-bootstrap4'
gem 'adroit-age'
gem 'remotipart' #ajax download image
gem 'seed_dump'
gem 'whenever'
gem 'dotenv-rails'
# gem 'paperclip-optimizer'
# gem 'dotenv-rails-deployment', requier: 'dotenv/deployment'
# gem 'paperclip-compression'
gem 'image_optim'
gem 'image_optim_pack'
gem 'paperclip-optimizer'
gem 'yandex-metrica-rails'
gem 'ckeditor'
group :development do
  gem 'capistrano', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rvm', require: false
  gem 'capistrano-rails-collection', require: false
  gem 'capistrano-rails-console', require: false
  gem 'capistrano-logtail', require: false
end