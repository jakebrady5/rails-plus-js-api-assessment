class MechanicsController < ApplicationController

  def home
    if !current_mechanic
      render 'static/visitor'
    end
    @mechanic = current_mechanic
  end

end
