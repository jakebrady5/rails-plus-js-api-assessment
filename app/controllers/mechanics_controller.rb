class MechanicsController < ApplicationController

  # def index
  #   @mechanics = Mechanic.all
  # end

  def home
    if !current_mechanic
      render 'static/visitor'
    end
    @mechanic = current_mechanic
  end

  # def new
  # end

  # def create
  # end

  def show
    @mechanic = Mechanic.find(params[:id])
  end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

end
