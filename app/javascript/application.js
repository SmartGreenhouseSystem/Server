// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "chartkick"
import "Chart.bundle"
import "./tabler.min"
import "channels"

import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = false

import jquery from "jquery"

window.$ = jquery

document.addEventListener("turbo:load", () => {
    $('form').on('submit', function(e) {
        e.preventDefault();
        return
        let modal = bootstrap.Modal.getInstance($(this).closest('.modal'))
        modal.hide()
    });    
})
