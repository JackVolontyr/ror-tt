class Admin::RoutesController < Admin::BaseController
  include ChooseRedirectType

  before_action :set_route, only: [:show, :edit, :update, :destroy]

  def index
    @routes = Route.all
  end

  def show
  end

  def new
    @route = Route.new
  end

  def edit
  end

  def create
    @route = Route.new(route_params)
    @route.save ? choose_redirect : render(:new)
  end

  def update
    @route.update(route_params) ? choose_redirect : render(:edit)
  end

  def destroy
    @route.destroy
    redirect_to routes_url
  end

  private

  def set_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:name, {train_ids: []}, {station_ids: []})
  end

  def choose_redirect
    redirect_to @route if end_changes?
    redirect_to edit_route_path(@route) if continue_changes?
  end
end
