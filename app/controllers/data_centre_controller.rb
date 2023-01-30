class DataCentreController < ApplicationController
  def index
    @readings = Reading.all
  end
end
