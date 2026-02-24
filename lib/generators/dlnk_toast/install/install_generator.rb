require "rails/generators"

module DlnkToast
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)

      desc "Install DlnkToast into your Rails application"

      def copy_initializer
        copy_file "initializer.rb", "config/initializers/dlnk_toast.rb"
        say "Created config/initializers/dlnk_toast.rb"
      end

      def add_importmap_pin
        return unless File.exist?("config/importmap.rb")
        append_to_file "config/importmap.rb", "\npin \"dlnk_toast\", preload: true"
        say "Added dlnk_toast to importmap.rb"
      end

      def inject_toast_in_layouts
        inject_into_file "app/views/layouts/application.html.erb", before: "</body>" do
          "\n  <%= render 'dlnk_toast/toast' %>\n"
        end
        say "Added toast partial to app/views/layouts/application.html.erb"

        if File.exist?("app/views/layouts/admin.html.erb")
          inject_into_file "app/views/layouts/admin.html.erb", before: "</body>" do
            "\n  <%= render 'dlnk_toast/toast' %>\n"
          end
          say "Added toast partial to app/views/layouts/admin.html.erb"
        end
      end

      def display_next_steps
        say "\n✓ DlnkToast installed successfully!"
        say "\nNext steps:"
        say "  1. Customize CSS variables in app/assets/stylesheets/application.css"
        say "  2. Adjust toast duration in config/initializers/dlnk_toast.rb if needed"
        say "  3. Flash notices/alerts will now appear as toasts!"
      end
    end
  end
end
