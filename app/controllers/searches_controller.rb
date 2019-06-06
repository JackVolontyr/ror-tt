class SearchesController < ApplicationController
  before_action :authenticate_user!

  def show
    stations = Route.joins(:stations)
    station_first = params[:station_first]
    station_last = params[:station_last]

    if station_first.present? && station_last.present?
      @routes = stations.where(stations: { name: [station_first, station_last] }).uniq
    end
  end
end