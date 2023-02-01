class DataCentreController < ApplicationController
  def index
    @measurements = Measurement.limit(page_params[:per_page]).offset(params[:page])
    @page = page_params[:page] || 1
    @count = Measurement.count
    @pages = (@count / page_params[:per_page].to_f).ceil || 1
    @start = ((@page.to_i - 1) * page_params[:per_page]) + 1
    @end = @start + @measurements.count - 1
  end

  private

  def page_params
    params.permit(:page).merge(per_page: 15)
  end
end
