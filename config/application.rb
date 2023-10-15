require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BreakingBarriers
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.perform_deliveries = true
    config.action_mailer.smtp_settings = {
      address:         'smtp.gmail.com',
      port:            587,
      domain:          'gmail.com',
      user_name:       'breaking.barriers.tamu.mailer@gmail.com',
      password:        'vpjj dmon vpun tocr',
      authentication:  'plain',
      enable_starttls: true,
      open_timeout:    5,
      read_timeout:    5 }

      ActionMailer::Base.raise_delivery_errors = true

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
