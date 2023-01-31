class DevicesController < ApplicationController
    def index
      @devices = [{name: "Servo controller", strength: 5}, {name: "Resource listener", strength: 1}]
    end
  end
  