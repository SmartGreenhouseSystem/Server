# frozen_string_literal: true

module ApplicationCable
  # Handles all of the authorization for websocket connections.
  class Connection < ActionCable::Connection::Base
    identified_by :current_user, :current_api_key

    def connect
      find_verified
    end

    private

    def find_verified
      setup_api_key
      setup_user

      reject_unauthorized_connection unless [current_user, current_api_key].any?
    end

    def setup_api_key
      api_key = request.params[:api_key]

      return unless api_key.present?

      self.current_api_key = ApiKey.find_by_value(api_key)
    end

    def setup_user
      self.current_user = env['warden'].user
    end
  end
end
