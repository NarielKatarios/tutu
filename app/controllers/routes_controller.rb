class RoutesController < ApplicationController

  def index
    @routes = Route.all
  end

  def show
    @route = Route.find(params[:id])
  end

  def new
    @route = Route.new
  end

  def edit
    @railway_stations = RailwayStation.all
    @route = Route.find(params[:id])
  end

  def create
    @route = Route.new(route_params)

    if @route.save
      redirect_to @route
    else
      render 'new'
    end
  end

  def update
    @route = Route.find(params[:id])

    if @route.update(route_params)
      redirect_to @route
    else
      render 'edit'
    end
  end

  def destroy
    @route = Route.find(params[:id])
    @route.destroy

    redirect_to routes_path
  end

  def add_station
    @station = RailwayStation.find(params[:railway_station])
    @route = Route.find(params[:route_id])
    @route.railway_stations.push(@station)
    redirect_to edit_route_path(@route)
  end

  def del_station
    @station = RailwayStation.find(params[:railway_station])
    @route = Route.find(params[:route_id])
    @route.railway_stations.delete(@station)
    redirect_to edit_route_path(@route)
  end

  private

  def route_params
    params.require(:route).permit(:title, :text)
  end
end
