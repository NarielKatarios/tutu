class TicketsController < ApplicationController

  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @train = Train.find_by(id: params[:train])
    @ticket = @train ? @train.tickets.new : Ticket.new
  end

  def edit
    @ticket = Ticket.find(params[:id])
    @train = @ticket.train
  end

  def create
    @train = Train.find(params[:ticket][:train_id])
    @ticket = @train.tickets.new(ticket_params)
    @ticket.user = User.find(params[:ticket][:user_id])
    @ticket.wagon = Wagon.find(params[:ticket][:wagon_id])

    if @ticket.save
      redirect_to @ticket
    else
      render 'new'
    end
  end

  def update
    @ticket = Ticket.find(params[:id])
    @ticket.user = User.find(params[:ticket][:user_id])
    @ticket.wagon = Wagon.find(params[:ticket][:wagon_id])
    if @ticket.update(ticket_params)
      redirect_to @ticket
    else
      render 'edit'
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy

    redirect_to tickets_path
  end

  private

  def ticket_params
    params.require(:ticket).permit(:number, :user_name, :user_surname, :user_patronymic, :start_station_id, :end_station_id)
  end
end
