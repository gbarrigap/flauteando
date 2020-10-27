# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.paths << Rails.root.join('node_modules', 'bulma-calendar', 'dist', 'css')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w(login.css admin.css home.css bulma-calendar.min.css)
# Rails.application.config.assets.precompile += Rails.root.join('node_modules', 'bulma-calendar', 'dist', 'css', 'bulma-calendar.min.css')
