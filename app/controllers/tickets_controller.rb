class TicketsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :index]

  def index
    @tickets = current_user.admin? ? Ticket.all : Ticket.where(user_id: current_user.id)
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @train = Train.find_by(id: params[:train])
    @ticket = @train ? @train.tickets.new(start_station_id: params[:arrival_station_id], end_station_id: params[:departure_station_id]) : Ticket.new
  end

  def edit
    @ticket = Ticket.find(params[:id])
    @train = @ticket.train
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)
    @ticket.wagon = Wagon.find(params[:ticket][:wagon_id])
    @ticket.train = Train.find(params[:ticket][:train_id])

    if @ticket.save
      redirect_to @ticket, notice: 'Билет куплен'
    else
      render 'new'
    end
  end

  def update
    @ticket = Ticket.find(params[:id])
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

    redirect_to tickets_path, notice: 'Билет удален'
  end

  private

  def ticket_params
    params.require(:ticket).permit(:number, :user_name, :user_surname, :user_patronymic, :start_station_id, :end_station_id)
  end
end
