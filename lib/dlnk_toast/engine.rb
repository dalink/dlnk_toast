# frozen_string_literal: true

module DlnkToast
  class Engine < ::Rails::Engine
    isolate_namespace DlnkToast

    initializer "dlnk_toast.helpers" do
      ActiveSupport.on_load(:action_controller_base) do
        helper DlnkToast::ToastHelper
      end
    end

    initializer "dlnk_toast.assets" do |app|
      app.config.assets.paths << root.join("app/assets/stylesheets")
      app.config.assets.paths << root.join("app/javascript")
    end

    initializer "dlnk_toast.i18n" do
      Engine.root.glob("config/locales/**/*.yml").each do |locale|
        I18n.load_path << locale unless I18n.load_path.include?(locale)
      end
    end

    initializer "dlnk_toast.turbo_streams" do
      ActiveSupport.on_load(:action_view) do
        if defined?(Turbo::Streams::TagBuilder) &&
           !Turbo::Streams::TagBuilder.ancestors.include?(DlnkToast::Streams)
          Turbo::Streams::TagBuilder.prepend(DlnkToast::Streams)
        end
      end
    end
  end
end
