class WelcomeController < ApplicationController

  def index
    @routes = Route.all
    @trains = Train.all
    @stations = Station.all
    @carriages = Carriage.all
  end
end
