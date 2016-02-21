class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
  end

  def new
  end

  def create
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
