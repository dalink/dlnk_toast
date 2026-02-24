require "rails/generators"

module DlnkToast
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)

      desc "Install DlnkToast into your Rails application"

      def copy_initializer
        copy_file "initializer.rb", "config/initializers/dlnk_toast.rb"
      end

      def setup_importmap
        return unless File.exist?("config/importmap.rb")

        append_to_file "config/importmap.rb",
          %(\npin "dlnk_toast/toast_controller", to: "dlnk_toast/toast_controller.js"\n)
      end

      def create_stimulus_bridge
        create_file "app/javascript/controllers/dlnk_toast_controller.js",
          %(export { default } from "dlnk_toast/toast_controller"\n)
      end

      def inject_stylesheet
        %w[application admin auth].each do |layout|
          path = "app/views/layouts/#{layout}.html.erb"
          next unless File.exist?(path)

          content = File.read(path)
          next if content.include?("dlnk_toast/application")

          inject_into_file path,
            after: /stylesheet_link_tag\s+:app.*\n/ do
            %(    <%= stylesheet_link_tag "dlnk_toast/application", "data-turbo-track": "reload" %>\n)
          end
        end
      end

      def inject_toast_partial
        %w[application admin auth].each do |layout|
          path = "app/views/layouts/#{layout}.html.erb"
          next unless File.exist?(path)

          content = File.read(path)
          next if content.include?("dlnk_toast/toast")

          inject_into_file path, before: "</body>" do
            "\n    <%= render \"dlnk_toast/toast\" %>\n  "
          end
        end
      end

      def display_post_install
        say ""
        say "DlnkToast installed!", :green
        say ""
        say "  Stylesheet:  dlnk_toast/application.css added to layouts"
        say "  Controller:  dlnk_toast_controller.js bridge created"
        say "  Partial:     dlnk_toast/toast injected before </body>"
        say "  Config:      config/initializers/dlnk_toast.rb"
        say ""
        say "Customize colors by overriding --dlnk-toast-* CSS variables."
      end
    end
  end
end
