# frozen_string_literal: true

class MicrocontrollerChannel < ApplicationCable::Channel
  def subscribed
    @device = Device.where(device_id: params[:mcid]).first_or_initialize.tap do |device|
      device.name = params[:name]
      device.rssi = -50
      device.save
    end

    stream_from "microcontroller:#{@device.device_id}"
  end

  def save(data)

    case data['name']
      when 'A'
        measurement_name = 'Atmospheric'
      when 'G'
        measurement_name = 'Greenhouse'
      when 'P'
        measurement_name = 'Pile room'
      else 
        measurement_name = "Measurement ->" + data['name']
    end

    Measurement.create(
      name: measurement_name,
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
    stop_stream_from "microcontroller:#{@device.device_id}"
  end
end
