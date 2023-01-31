class DataCentreController < ApplicationController
  def index
    @measurements = Measurement.all
  end
end
