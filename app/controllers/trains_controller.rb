class TrainsController < ApplicationController
  include ApplicationHelper
  before_action :set_train, only: [:show, :edit, :update, :destroy]

  def index
    @trains = Train.all
  end

  def show
    carriages_type = params[:carriages_type]
    seats_type = params[:seats_type]

    if carriages_type.present? && seats_type.present?
      seats_count = @train.seats_count_by_type(carriages_type, seats_type)

      flash[:seats_count] = {
        carriages_type: get_carriage_types.key(carriages_type),
        seats_count: seats_count,
        seats_type: get_seat_types.key(seats_type),
        carriages_type_selected: carriages_type,
        seats_type_selected: seats_type
      }

      respond_to do |format|
        format.html { redirect_to @train }
      end
    end
  end

  def new
    @train = Train.new
  end

  def edit
  end

  def create
    @train = Train.new(train_params)

    respond_to do |format|
      if @train.save
        format.html { redirect_to @train, notice: 'Train was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @train.update(train_params)
        format.html { redirect_to @train, notice: 'Поезд успешно обновлен.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @train.destroy
    respond_to do |format|
      format.html { redirect_to trains_url, notice: 'Поезд успешно удален.' }
    end
  end

  private
  def set_train
    @train = Train.find(params[:id])
  end

  def train_params
    params.require(:train).permit(:number, :route_id, {carriage_ids: []})
  end
end
