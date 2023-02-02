import { Controller } from "@hotwired/stimulus"

import { connect_to_home } from "../channels/home_channel"

// Connects to data-controller="home"
export default class extends Controller {
  connect() {
    connect_to_home();
  }
}
