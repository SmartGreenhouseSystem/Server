# frozen_string_literal: true

class DevicesController < ApplicationController
  def index
    @devices = current_user.devices
  end

  def edit
    @device = Device.find(params[:id])
  end

  def update
    @device = Device.find(params[:id])
    if @device.update(device_params)
      render turbo_stream: turbo_stream.replace("device-row-#{@device.id}", partial: 'device', locals: { device: @device })
    else
      render turbo_stream: turbo_stream.replace('modal', partial: 'control', locals: { device: @device })
    end
  end

  private

  def device_params
    params.require(:device).permit(:name)
  end
end
