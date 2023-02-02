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

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
