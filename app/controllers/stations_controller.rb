class StationsController < ApplicationController
  include ChooseRedirectType

  before_action :set_station, only: [:show, :edit, :update, :destroy, :update_position ]

  def index
    @stations = Station.all
  end

  def show
  end

  def new
    @station = Station.new
  end

  def edit
  end

  def create
    @station = Station.new(station_params)
    @station.save ? choose_redirect : render(:new)
  end

  def update
    @station.update(station_params) ? choose_redirect : render(:edit)
  end

  def destroy
    @station.destroy
    redirect_to stations_url
  end

  def update_position
    @route = Route.find(params[:route_id])
    @station.update_position(@route, params[:position])
    redirect_to edit_route_path(@route)
  end

  private

  def set_station
    @station = Station.find(params[:id])
  end

  def station_params
    params.require(:station).permit(:name)
  end

  def choose_redirect
    redirect_to @station if end_changes?
    redirect_to edit_station_path(@station) if continue_changes?
  end
end
