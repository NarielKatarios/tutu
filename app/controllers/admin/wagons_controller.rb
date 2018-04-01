class Admin::WagonsController < Admin::BaseController
  before_action :set_wagon, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:new, :create, :edit, :update]

  def index
    @wagons = Wagon.all
  end

  def show
  end

  def new
    #@wagon = @train.wagons.new(wagon_params)
    @wagon = params[:type].constantize.new(wagon_params)
  end

  def edit
    @trains = Train.all
  end

  def create
    @wagon = params[:type].constantize.new(wagon_params)
    @wagon.number = @wagon.set_wagon_number
    @wagon.seats_count_for_wagon_type
    respond_to do |format|
      if @wagon.save
        format.html { redirect_to train_path(@train), notice: 'Wagon was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @wagon.update(wagon_params)
        format.html { redirect_to @wagon, notice: 'Wagon was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @wagon.destroy
    respond_to do |format|
      format.html { redirect_to wagons_url, notice: 'Wagon was successfully destroyed.' }
    end
  end

  private

  def set_train
    @train = Train.find params[:train_id]
  end

  def set_wagon
    @wagon = Wagon.find(params[:id])
  end

  def wagon_params
    params.permit(:number, :train_id, :bottom_seats, :top_seats, :side_bottom_seats, :side_top_seats, :sedentary_seats, :type)
  end
end