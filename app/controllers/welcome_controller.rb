class WelcomeController < ApplicationController

  def index
    @routes = Route.all
    @trains = Train.all
    @stations = Station.all
    @carriages = Carriage.all
    @tickets = Ticket.all
    @services = Service.all
  end
end
