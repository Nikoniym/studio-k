# encoding: utf-8

##
# Backup v5.x Configuration
#
# Documentation: http://backup.github.io/backup
# Issue Tracker: https://github.com/backup/backup/issues


require 'yaml'
require 'dotenv'

# Get our environment variables
Dotenv.load

# Get the current Rails Environment, otherwise default to development
RAILS_ENV = ENV['RAILS_ENV'] || 'development'

# Load database.yml, including parsing any ERB it might
# contain. Remember if you're using Mongo, this should be
# mongoid.yml
DB_CONFIG = YAML.load(ERB.new(File.read(File.expand_path('../../config/database.yml',  __FILE__))).result)[RAILS_ENV]

# Set defaults for S3 which can be shared across multiple backup models
