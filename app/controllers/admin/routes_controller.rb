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
    # http://localhost:3000/routes/5/del_station?railway_station=1
    @station = RailwayStation.find(params[:railway_station])
    @route = Route.find(params[:route_id])
    @route.railway_stations.delete(@station)
    redirect_to edit_admin_route_path(@route)
  end

  def increase_station_number
    @route = Route.find(params[:route_id])
    stations_routes = @route.railway_stations_routes.find(params[:stations_routes])
    num = stations_routes.station_number ? stations_routes.station_number + 1 : 1
    stations_routes.update(station_number: num)
    redirect_to [:admin, @route]
  end

  def decrease_station_number
    @route = Route.find(params[:route_id])
    stations_routes = @route.railway_stations_routes.find(params[:stations_routes])
    num = stations_routes.station_number ? stations_routes.station_number - 1 : 1
    stations_routes.update(station_number: num)
    redirect_to [:admin, @route]
  end

  private

  def route_params
    params.require(:route).permit(:title, :text, railway_station_ids: [], station_number: [])
  end
end
