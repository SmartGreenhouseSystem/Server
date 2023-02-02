import { Controller } from "@hotwired/stimulus"

// import { Modal } from "bootstrap"

// Connects to data-controller="device-modal"
export default class extends Controller {
  connect() {
    this.modal = new bootstrap.Modal(this.element);
    console.log('connected!')
  }

  updateDevice(event) {
    console.log('a')
    event.preventDefault();
    // this.modal.hide();
  }

  disconnect() {
    this.modal.hide();
    console.log('disconnected')
  }
}
