class Admin::RoutesController < Admin::BaseController

  def index
    @routes = Route.all
  end

  def show
    @route = Route.find(params[:id])
    @trains = Train.all
    # @station_number = RailwayStationsRoute.find(params[:station_number])
  end

  def new
    @route = Route.new
  end

  def edit
    @route = Route.find(params[:id])
    @railway_stations = RailwayStation.all - @route.railway_stations
  end

  def create
    @route = Route.new(route_params)

    if @route.save
      redirect_to [:admin, @route]
    else
      render 'new'
    end
  end

  def update
    @route = Route.find(params[:id])

    if @route.update(route_params)
      redirect_to [:admin, @route]
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
    redirect_to edit_admin_route_path(@route)
  end

  def del_station
    @station = RailwayStation.find(params[:railway_station])
    @route = Route.find(params[:route_id])
    @route.railway_stations.delete(@station)
    redirect_to edit_admin_route_path(@route)
  end

  private

  def route_params
    params.require(:route).permit(:title, :text, railway_station_ids: [], station_number: [])
  end
end
