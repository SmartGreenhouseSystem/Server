import { Controller } from "@hotwired/stimulus"

import consumer from "channels/consumer"

import jquery from "jquery"

window.$ = jquery

// Connects to data-controller="home"
export default class extends Controller {
  connect() {
    this.subscription = consumer.subscriptions.create("HomeChannel", {
      connected() {
        console.log('connected')
        // Called when the subscription is ready for use on the server
      },
  
      disconnected() {
        // Called when the subscription has been terminated by the server
      },
  
      received(data) {
        // Called when there's incoming data on the websocket for this channel
      }
    });
  }

  updateActuator() {
    var buffer = 0;
    for(let actuator of $('.actuator-element')) {
      buffer += actuator.checked
      buffer <<= 1
    }

    buffer >>= 1

    console.log(buffer);
    this.subscription.send({action: 'control', instruction: buffer, device_id: 1});
  }
}
