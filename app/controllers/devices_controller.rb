# frozen_string_literal: true

class DevicesController < ApplicationController
  def index
    @devices = current_user.devices
  end

  def update; end
end
