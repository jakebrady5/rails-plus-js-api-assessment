class MechanicsController < ApplicationController

  def home
    if !current_mechanic
      render 'static/visitor'
    end
    @mechanic = current_mechanic
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end

end
