class DevicesController < ApplicationController
    def index
      @devices = Device.all
    end

    def update; end
  end
  