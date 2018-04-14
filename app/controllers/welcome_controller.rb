class WelcomeController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    current_user.admin? ? return : redirect_to(search_index_path)
  end
end
