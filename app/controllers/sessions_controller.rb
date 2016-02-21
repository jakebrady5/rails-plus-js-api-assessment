class SessionsController < ApplicationController

  def new
  end

  def verify

  end

  def create
    mechanic = Mechanic.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']

      # this is horrible, but pw can't be blank, revisit
      u.password = "password"
    end
    sign_in(mechanic)
    session[:mechanic_id] = mechanic.id
    redirect_to mechanic_path(mechanic)
  end

  def auth
    request.env['omniauth.auth']
  end

  def destroy
    session.destroy
    redirect_to '/'
  end

end