require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Firewalker
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
  end
end

Twitter.configure do |config|
  config.consumer_key = 'SggGnks5GAdohEUYr4ASQ'
  config.consumer_secret = 'lApArEZkXuGVNGdPvnoexe5teYr8FCpC470mLAHI'
  config.oauth_token = '1315442514-uVb0yJ5zIA1NruSTP15Tq6RQc1ammJeYNZitz9g'
  config.oauth_token_secret = '9zcWgLV09CoKpaJ2I6zM3BbulSuGSZ4jzXGbq4DHiI'
end