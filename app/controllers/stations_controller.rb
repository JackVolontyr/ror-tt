class StationsController < ApplicationController
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

    if @station.save
      redirect_to @station
    else
      render :new
    end
  end

  def update
    if @station.update(station_params)
      redirect_to @station
    else
      render :edit
    end
  end

  def destroy
    @station.destroy
    redirect_to stations_url
  end

  def update_position
    @route = Route.find(params[:route_id])
    @station.update_position(@route, params[:position])
    redirect_to @route
  end

  private

  def set_station
    @station = Station.find(params[:id])
  end

  def station_params
    params.require(:station).permit(:name)
  end
end
