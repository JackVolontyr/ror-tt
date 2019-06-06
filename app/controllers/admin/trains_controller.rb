class Admin::TrainsController < ApplicationController
  include ApplicationHelper
  include ChooseRedirectType

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

      redirect_to [:admin, @train]
    end
  end

  def new
    @train = Train.new
  end

  def edit
  end

  def create
    @train = Train.new(train_params)
    @train.save ? choose_redirect : render(:new)
  end

  def update
    @train.update(train_params) ? choose_redirect : render(:edit)
  end

  def destroy
    @train.destroy
    redirect_to admin_trains_url
  end

  private

  def set_train
    @train = Train.find(params[:id])
  end

  def train_params
    params.require(:train).permit(:number, :route_id, {carriage_ids: []})
  end

  def choose_redirect
    redirect_to [:admin, @train] if end_changes?
    redirect_to edit_admin_train_path(@train) if continue_changes?
  end
end
