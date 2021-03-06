# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += %w( sign_in.css )
Rails.application.config.assets.precompile += %w( end_page.css )
Rails.application.config.assets.precompile += %w( error.css )
Rails.application.config.assets.precompile += %w( game.css )
Rails.application.config.assets.precompile += %w( main1.css )
Rails.application.config.assets.precompile += %w( profil.css )
Rails.application.config.assets.precompile += %w( reg.css )
Rails.application.config.assets.precompile += %w( gign_in.css )
Rails.application.config.assets.precompile += %w( user.css )