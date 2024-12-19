# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
Rails.application.config.assets.paths << Rails.root.join('node_modules/@coreui/coreui/dist/js')
Rails.application.config.assets.paths << Rails.root.join('node_modules/@coreui/icons/fonts')
Rails.application.config.assets.paths << Rails.root.join('node_modules/simplebar/dist')

# only use for home page
Rails.application.config.assets.paths << Rails.root.join('node_modules/chart.js/dist')
Rails.application.config.assets.paths << Rails.root.join('node_modules/@coreui/chartjs/dist/js')
Rails.application.config.assets.paths << Rails.root.join('node_modules/@coreui/chartjs/dist/css')
Rails.application.config.assets.paths << Rails.root.join('node_modules/@coreui/utils/dist')
# only use for home page

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

