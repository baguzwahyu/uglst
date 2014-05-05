require File.expand_path('../boot', __FILE__)

require 'active_model/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'

Bundler.require(*Rails.groups)

module Uglst
  class Application < Rails::Application
    config.active_support.escape_html_entities_in_json = true
    config.assets.enabled = true
    config.assets.version = '1.0'
    config.encoding = 'utf-8'
    config.filter_parameters += [:password, :password_confirmation]
    config.time_zone = 'UTC'

    config.generators do |g|
      g.helper = false
      g.helper_specs false
      g.javascripts = false
      g.stylesheets = false
      g.test_framework :rspec, fixture: true
      g.view_specs false
    end

    console do
      config.console = Pry
    end

    config.after_initialize do
      if %w{development test}.include?(Rails.env)
        Hirb.enable
      end
    end
  end
end
