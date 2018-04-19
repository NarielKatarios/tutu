class Admin::TrainsController < Admin::BaseController
  before_action :set_train, only: [:show, :edit, :update, :destroy]

  def index
    @trains = Train.all
  end

  def show
  end

  def new
    @train = Train.new
  end

  def edit
    @routes = Route.all
  end

  def create
    @train = Train.new(train_params)
    respond_to do |format|
      if @train.save
        format.html { redirect_to [:admin, @train], notice: 'Train was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @train.update(train_params)
        format.html { redirect_to @train, notice: 'Train was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @train.destroy
    respond_to do |format|
      format.html { redirect_to trains_url, notice: 'Train was successfully destroyed.' }
    end
  end

  def add_route
    @route = Route.find(params[:route])
    @train = Train.find(params[:train_id])
    @train.route = @route
    @train.save
    redirect_to edit_train_path(@train)
  end

  private

  def set_train
    @train = Train.find(params[:id])
  end

  def train_params
    params.require(:train).permit(:number, :current_station_id, :route_id, :sort_by_tail)
  end
end
