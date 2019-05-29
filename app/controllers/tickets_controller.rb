class TicketsController < ApplicationController
  include ChooseRedirectType

  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def index
    @tickets = Ticket.all
  end

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def edit
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.save ? choose_redirect : render(:new)
  end

  def update
    @ticket.update(ticket_params) ? choose_redirect : render(:edit)
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_url
  end

  private
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(
      :route_id, :train_id, :user_id,
      :station_first_id, :station_last_id,
      :name, :user_name, :comments
    )
  end

  def choose_redirect
    redirect_to @ticket if end_changes?
    redirect_to edit_ticket_path(@ticket) if continue_changes?
  end
end
