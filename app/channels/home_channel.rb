# frozen_string_literal: true

class HomeChannel < ApplicationCable::Channel
  def subscribed
    stream_for current_user
  end

  def control(data)
    ActionCable.server.broadcast(
      "microcontroller:#{data['device_id']}",
      { 'type': 'control', 'instruction': data['instruction'] }
    )
  end

  def save(actuator)
    Actuator.create(
      name: actuator['name'],
      state: actuator['state'],
      consumption: actuator['consumption'],
      recorded_at: Time.Now(),
      device: @device
    )
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
