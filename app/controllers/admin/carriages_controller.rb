class Admin::CarriagesController < Admin::BaseController
  include ChooseRedirectType

  before_action :set_carriage, only: [:show, :edit, :update, :destroy]
  before_action :set_train

  def index
    # TODO:
    # if params[:train_id]
      # @carriages = Train.find(params[:train_id]).includes(:trains).carriages
    # else
      @carriages = Carriage.all
    # end
  end

  def show
  end

  def new
    @carriage = Carriage.new
  end

  def edit
  end

  def create
    @carriage = @train.carriages.new(carriage_params)
    @carriage.save ? choose_redirect : render(:new)
  end

  def update
    @carriage.update(carriage_params) ? choose_redirect : render(:edit)
  end

  def destroy
    @carriage.destroy
    choose_redirect
  end

  private

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end

  def carriage_params
    params.require(:carriage).permit(
        :number, :carriage_type, :seats,
        :type, :bottom_seats, :top_seats, :side_bottom_seats, :side_top_seats,
        :train_id, :position
    )
  end

  def choose_redirect
    # TODO: maybe it's not best solution
    redirect_to train_carriages_url
  end
end