# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
#Rails.application.config.assets.paths << Emoji.images_path

Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'fonts', 'images', 'imgs', 'javascripts', 'plugins')
Rails.application.config.assets.precompile += %w(layout_2.css layout_2.js layout_dhtmlx.js layout_dhtmlx.css log_in.css dhtmlx.css dashboard.js users.js niveis.js *.png *.gif theme/AdminLTE/app.js )