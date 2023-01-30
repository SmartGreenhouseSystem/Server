class MicrocontrollerChannel < ApplicationCable::Channel
  def subscribed
    stream_from "controller_#{params[:mcid]}"
  end

  def received(data)
    puts "Dobio sam podatak + #{data['informacija']}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
