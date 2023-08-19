import { Controller } from "@hotwired/stimulus"

// import { Modal } from "bootstrap"

// Connects to data-controller="device-modal"
export default class extends Controller {
  connect() {
    this.modal = new bootstrap.Modal(this.element);
    this.modal.show();
  }

  updateDevice() {
    this.modal.hide();
  }

  disconnect() {
    this.modal.hide();
  }
}
