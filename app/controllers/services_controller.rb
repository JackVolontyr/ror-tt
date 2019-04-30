class ServicesController < ApplicationController
  include ChooseRedirect

  before_action :set_service, only: [:show, :edit, :update, :destroy]

  def index
    @services = Service.all
  end

  def show
  end

  def new
    @service = Service.new
  end

  def edit
  end

  def create
    @service = Service.new(service_params)
    @service.save ? choose_redirect_for_service : render(:new)
  end

  def update
    @service.update(service_params) ? choose_redirect_for_service : render(:edit)
  end

  def destroy
    @service.destroy
    redirect_to services_url
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:name)
  end

  def choose_redirect_for_service
    choose_redirect @service, edit_service_path(@service)
  end
end