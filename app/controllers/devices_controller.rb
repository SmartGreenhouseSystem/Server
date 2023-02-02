# frozen_string_literal: true

class DevicesController < ApplicationController
  def index
    @devices = Device.all
  end
end
