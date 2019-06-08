class TicketsController < ApplicationController
  include ChooseRedirectType

  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  def index
    # TODO:
    # if params[:user_id]
      # @tickets = User.find(params[:user_id]).includes(:users).tickets
    # else
      @tickets = Ticket.all
    # end
  end

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def edit
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)
    @ticket.save ? choose_redirect : render('new')
  end

  def update
    @ticket.update(ticket_params) ? choose_redirect : render(:edit)
  end

  def destroy
    @ticket.destroy
    choose_redirect
  end

  private
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def set_user
    @user = User.find(current_user.id)
  end

  def ticket_params
    params.require(:ticket).permit(
      :route_id, :train_id, :user_id,
      :station_first_id, :station_last_id,
      :name, :user_name, :comments
    )
  end

  def choose_redirect
    # TODO: maybe it's not best solution
    redirect_to render 'index'
  end
end
