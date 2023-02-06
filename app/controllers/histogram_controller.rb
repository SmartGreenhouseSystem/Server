# frozen_string_literal: true

class HistogramController < ApplicationController
  def index
    page = page_params[:page] || 1
    @measurements = Measurement.order('created_at DESC').page(page).per(15)
    @count = Measurement.count
    @pages = (@count / 15.to_f).ceil || 1
    @start = ((page.to_i - 1) * 15) + 1
    @end = @start + @measurements.count - 1
  end

  private
  def page_params
    params.permit(:page)
  end
end
