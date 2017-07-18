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


