# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'simplecov'
SimpleCov.start 'rails'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

require 'rspec/rails'
require 'rspec/autorun'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

## Requires spec_helper extensions
Dir[Rails.root.join('spec/spec_helper/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    # Disable the 'should' sytax
    c.syntax = :expect
  end

  # Mock Framework
  config.mock_with :rspec

  # Mock Warden stuff
  config.include Warden::Test::ControllerHelpers, type: :controller
  def sign_in(user)
    warden.set_user(user)
  end

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'

  #automatically infer an example group's spec type from the file location.
  config.infer_spec_type_from_file_location!
end