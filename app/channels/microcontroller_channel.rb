class MicrocontrollerChannel < ApplicationCable::Channel
  def subscribed
    @device =
      Device.where(device_id: params[:mcid]).first_or_initialize.tap do |device|
        device.name = params[:name]
        device.rssi = -50
        device.save
      end

    stream_for @device
  end

  def save(data)
    Measurement.create(name: data['name'], value: data['value'], recorded_at: Time.at(data['recorded_at']))
  end

  def update(data)  
    @device.rssi = data['RSSI']
  end

  def unsubscribed
    stop_stream_for @device
  end
end
