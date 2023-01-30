class MicrocontrollerChannel < ApplicationCable::Channel
  def subscribed
    stream_from "controller_#{params[:mcid]}"
  end

  def save(data)
    Reading.create(name: data['name'], value: data['value'], recored_at: Time.at(data['recorded_at']))
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
