class SearchesController < ApplicationController
  before_action :authenticate_user!

  def show
    @stations = Station.all
    station_first = params[:station_first]
    station_last = params[:station_last]

    if station_first.present? && station_last.present?
      @routes = Route.joins(:stations)
                    .where(stations: { name: [station_first, station_last] })
                    .uniq
    end
  end
end