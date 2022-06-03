require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Server
  class Application < Rails::Application
    config.load_defaults 7.0

    config.eager_load_paths += %W[#{config.root}/lib]
    config.autoload_paths += %W[#{config.root}/lib]

    config.api_only = true
  end
end
