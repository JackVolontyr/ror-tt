class Admin::StationsController < Admin::BaseController
  include ChooseRedirectType

  before_action :set_station, only: [:show, :edit, :update, :destroy]

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

  def update_value(value)
    @route = Route.find(params[:route_id])
    set_station.update_value(@route, value, params[value])
    redirect_to edit_route_path(@route)
  end

  def update_position
    update_value "position"
  end

  def update_arrival
    update_value "arrival"
  end

  def update_departure
    update_value "departure"
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
