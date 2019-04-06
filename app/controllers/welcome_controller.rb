class WelcomeController < ApplicationController

  def index
    @routes = Route.all
    @trains = Train.all
    @stations = Station.all
    @services = Service.all
  end
end
