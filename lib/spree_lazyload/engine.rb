module SpreeLazyload
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_lazyload'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc

    initializer "spree.register.config", before: :load_config_initializers do |app|
      Spree::AppConfiguration.class_eval do
        preference :all_images_lazy, :boolean
      end

      Spree.config do |config|
        config.all_images_lazy = false if config.all_images_lazy.nil?
      end
    end
  end
end
