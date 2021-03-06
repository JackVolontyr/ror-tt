class Admin::CarriagesController < Admin::BaseController
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
    @carriage.save ? redirect_to(admin_train_carriages_path(@train)) : render(:new)
  end

  def update
    @carriage.update(carriage_params) ? redirect_to(admin_train_carriages_path(@train)) : render(:edit)
  end

  def destroy
    @carriage.destroy
    redirect_to(admin_train_carriages_path(@train))
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
end