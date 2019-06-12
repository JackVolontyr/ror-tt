class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :set_user

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
    @ticket = current_user.tickets.new(ticket_params)
    @ticket.save ? redirect_to(user_tickets_path) : render(:new)
  end

  def update
    @ticket.update(ticket_params) ? redirect_to(user_tickets_path) : render(:edit)
  end

  def destroy
    @ticket.destroy
    redirect_to user_tickets_path
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
end
