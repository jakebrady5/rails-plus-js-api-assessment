class MechanicsController < ApplicationController

  def home
    if !current_mechanic
      render 'static/visitor'
    end
    #respond to html json
    @mechanic = current_mechanic
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    #respond to html json
  end

end
