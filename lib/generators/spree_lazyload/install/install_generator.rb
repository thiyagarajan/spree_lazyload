module SpreeLazyload
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)#This line added
      class_option :auto_run_migrations, :type => :boolean, :default => false

      # copy configuration
      def copy_placeholder
        template 'placeholder.gif', 'app/assets/images/lazyload_placeholder.gif'
      end

      def add_javascripts
        append_file 'vendor/assets/javascripts/spree/frontend/all.js', "//= require spree/frontend/spree_lazyload\n"
        append_file 'vendor/assets/javascripts/spree/backend/all.js', "//= require spree/backend/spree_lazyload\n"
      end
    end
  end
end
