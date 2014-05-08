# encoding: utf-8
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

require 'capybara/rspec'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

module ControllerMacros
  def login_as_user
    before(:each) do
    end
  end
end

RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller

  config.color_enabled                                   = true
  config.fixture_path                                    = "#{Rails.root}/spec/fixtures"
  config.infer_base_class_for_anonymous_controllers      = true
  config.order                                           = 'random'
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.tty                                             = true
  config.use_transactional_fixtures                      = true
end
