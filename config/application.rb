require_relative 'boot'

require 'rails/all'
require 'susy'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Krylia
  class Application < Rails::Application
    config.i18n.default_locale = :ru
    config.active_record.time_zone_aware_types = [:datetime, :time]
    config.assets.image_optim = false
  end
end
