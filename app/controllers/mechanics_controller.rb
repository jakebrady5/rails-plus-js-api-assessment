class MechanicsController < ApplicationController

  def home
    if !current_mechanic
      render 'static/visitor'
    end
    #respond to html json
    @mechanic = current_mechanic
    @jobs = Job.all
    respond_to do |format|
      format.html { render :home }
      format.json { render json: @jobs}
    end
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    #respond to html json
  end

end
