class RoutesController < ApplicationController
  include ChooseRedirectType

  before_action :set_route, only: [:show, :edit, :update, :destroy]

  def index
    # TODO: ARQI
    stations = Route.includes(:stations)
    station_first = params[:station_first]
    station_last = params[:station_last]

    if station_first.present? && station_last.present?
      @routes = stations.where(stations: { name: [station_first, station_last] })

    elsif station_first.present?
      @routes = stations.where(stations: { name: station_first })

    elsif station_last.present?
      @routes = stations.where(stations: { name: station_last })

    else
      @routes = Route.all
    end
  end

  def show
  end

  def new
    @route = Route.new
  end

  def edit
  end

  def create
    @route = Route.new(route_params)
    @route.save ? choose_redirect : render(:new)
  end

  def update
    @route.update(route_params) ? choose_redirect : render(:edit)
  end

  def destroy
    @route.destroy
    redirect_to routes_url
  end

  private

  def set_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:name, {train_ids: []}, {station_ids: []})
  end

  def choose_redirect
    redirect_to @route if end_changes?
    redirect_to edit_route_path(@route) if continue_changes?
  end
end
