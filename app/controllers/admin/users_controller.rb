class Admin::UsersController < Admin::BaseController
  before_action :authenticate_user!, except: :index

  def index
    @users = current_user.admin? ? User.all : User.where(user_id: current_user.id)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to [:admin, @user], notice: 'Пользователь обновлен'
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to admin_users_path, notice: 'Пользователь удален'
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
