class StaticController < ApplicationController

  def home
  end

  def signin

  end

  def signup
    @mechanic = Mechanic.new
  end

end