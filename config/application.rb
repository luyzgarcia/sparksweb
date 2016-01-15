require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ControleCargas
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.

    config.sass.load_paths << File.expand_path('../../vendor/assets/stylesheets/')

    config.i18n.default_locale = 'pt-BR'

    #config.assets.paths << Rails.root.join("app", "assets", "fonts")
    config.assets.paths << Rails.root.join('app', 'assets', 'fonts', 'images', 'javascripts', 'plugins')
    config.assets.precompile += %w(.svg .eot .woff .ttf .png empresas.js redespachos.js')

    config.active_record.raise_in_transactional_callbacks = true
    config.to_prepare do
      Devise::SessionsController.layout "log_in"
      Devise::RegistrationsController.layout proc{ |controller| user_signed_in? ? "application" : "log_in" }
    end

    config.assets.enabled = true
    #Less
    #config.less.paths << "#{Rails.root}/vendor/assets/stylesheets/theme/less"
    #config.less.compress = true

    #config.assets.enabled = true
    #config.assets.initialize_on_precompile = true
    require 'roo'
    #require 'csv'
    #require 'iconv'


    #configuracao dos templates do angularJS
    config.angular_templates.ignore_prefix  = %w(sparksApp/templates/)
  end
end
