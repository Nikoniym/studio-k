# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( special_layout.css )
Rails.application.config.assets.precompile += %w( footer/special_layout.js )
Rails.application.config.assets.precompile += %w( filterrific/filterrific-spinner.gif )
Rails.application.config.assets.precompile += %w( person/person.css )
Rails.application.config.assets.precompile += %w( person/person.js )
Rails.application.config.assets.precompile += %w( ckeditor/*)
Rails.application.config.assets.precompile += %w(ckeditor/config.js)

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, special_layout.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
