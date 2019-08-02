class WelcomesController < ApplicationController

  def index
    @routes = Route.all
    @trains = Train.all
    @stations = Station.all
    @carriages = Carriage.all
    @tickets = Ticket.all

    @questions = Question.all
    @question = Question.new
    @attachment = @question.attachments.build
  end
end
