class CarriagesController < ApplicationController
  include ChooseRedirectType

  before_action :set_carriage, only: [:show, :edit, :update, :destroy]

  def index
    @carriages = Carriage.all
  end

  def show
  end

  def new
    @carriage = Carriage.new
  end

  def edit
  end

  def create
    @carriage = Carriage.new(carriage_params)
    @carriage.save ? choose_redirect : render(:new)
  end

  def update
    @carriage.update(carriage_params) ? choose_redirect : render(:edit)
  end

  def destroy
    @carriage.destroy
    redirect_to carriages_url
  end

  private

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  def carriage_params
    params.require(:carriage).permit(
        :number, :carriage_type, :seats,
        :type, :bottom_seats, :top_seats, :side_bottom_seats, :side_top_seats,
        :train_id, :position
    )
  end

  def choose_redirect
    redirect_to @carriage if end_changes?
    redirect_to edit_carriage_path(@carriage) if continue_changes?
  end
end