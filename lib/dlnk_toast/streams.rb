# frozen_string_literal: true

module DlnkToast
  module Streams
    # Append a toast notification via Turbo Stream.
    #
    #   turbo_stream.toast(:notice, "Saved!")
    #   turbo_stream.toast(:alert, "Something went wrong.")
    #
    def toast(type, message)
      return if message.blank?

      append "dlnk-toast-container",
             partial: "dlnk_toast/toast_message",
             locals: { type: type.to_sym, message: message }
    end
  end
end
