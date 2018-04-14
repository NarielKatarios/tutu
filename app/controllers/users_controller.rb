class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:create, :index]

  def index
    @users = current_user.admin? ? User.all : User.where(user_id: current_user.id)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'Пользователь создан'
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user, notice: 'Пользователь обновлен'
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path, notice: 'Пользователь удален'
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
