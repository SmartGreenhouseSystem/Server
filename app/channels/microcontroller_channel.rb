# frozen_string_literal: true

# Websocket for Microcontrollers
class MicrocontrollerChannel < ApplicationCable::Channel
  def subscribed
    @device = Device.find_or_create_by(api_key: current_api_key) do |device|
      device.name = params[:name]
    end

    # Make sure that the device is saved in the REDIS database
    @device.rssi = -50

    stream_from "microcontroller:#{@device.id}"
  end

  def save(data)
    Measurement.create(
      name: data['name'],
      value: data['value'],
      unit: data['unit'],
      measurement_type: data['measurement_type'],
      recorded_at: Time.at(data['recorded_at']),
      device: @device
    )
  end

  def update(data)
    @device.rssi = data['RSSI']
  end

  def unsubscribed
    stop_stream_from "microcontroller:#{@device.id}"
  end
end
