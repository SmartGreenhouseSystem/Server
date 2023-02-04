# frozen_string_literal: true

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user, :current_device

    def connect
      find_verified
    end

    private

    def find_verified
      setup_controller if controller_id.present?
      setup_user
   
      #reject_unauthorized_connection unless [self.current_user, self.current_device].any?
    end

    def controller_id
      request.params[:device_id]
    end

    def setup_controller
      self.current_device = Device.find_by_device_id(controller_id)
      p current_device
    end

    def setup_user
      self.current_user =
        if (verified_user = env['warden'].user)
          verified_user
        end
    end
  end
end
