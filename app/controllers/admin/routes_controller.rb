class Admin::RoutesController < Admin::BaseController
  before_action :set_route, only: [:show, :edit, :update, :destroy]
  before_action :set_trains, only: [:new, :edit]
  before_action :set_stations, only: [:new, :edit]

  def index
    @routes = Route.all
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
    @route.save ? redirect_to(admin_routes_path) : render(:new)
  end

  def update
    @route.update(route_params) ? redirect_to(admin_routes_path) : render(:edit)
  end

  def destroy
    @route.destroy
    redirect_to(admin_routes_path)
  end

  private

  def set_route
    @route = Route.find(params[:id])
  end

  def set_trains
    @trains = Train.all
  end

  def set_stations
    @stations = Station.all
  end

  def route_params
    params.require(:route).permit(:name, {train_ids: []}, {station_ids: []})
  end
end
