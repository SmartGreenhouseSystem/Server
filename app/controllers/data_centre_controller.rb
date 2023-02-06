# frozen_string_literal: true

class DataCentreController < ApplicationController
  def index
    temperature_names = ['Atmospheric', 'Greenhouse', 'Pile room']
    @temperatures = Measurement.where(name: temperature_names, measurement_type: 'T').order(created_at: :desc).limit(3)
    humidity_names = ['Atmospheric', 'Greenhouse', 'Pile room']
    @humidities = Measurement.where(name: humidity_names, measurement_type: 'H').order(created_at: :desc).limit(3)
  end
end