require File.expand_path('../boot', __FILE__)
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"

Bundler.require(:default, Rails.env)

module Bluporter
  class Application < Rails::Application
    config.i18n.load_path = Dir[Rails.root.join('config', 'locales', '**', '*.yml').to_s]
    config.i18n.default_locale = :en
    I18n.enforce_available_locales = true

    # Add Bower components
    config.assets.paths << Rails.root.join('vendor', 'assets', 'components')
    # Load Grape API
    config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[Rails.root.join('app', 'api', '*')]
  end
end
