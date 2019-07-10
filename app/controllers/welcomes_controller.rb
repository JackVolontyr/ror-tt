class WelcomesController < ApplicationController

  def index
    @routes = Route.all
    @trains = Train.all
    @stations = Station.all
    @carriages = Carriage.all
    @tickets = Ticket.all
    @questions = Question.all
  end
end
