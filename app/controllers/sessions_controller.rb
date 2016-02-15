class SessionsController < ApplicationController

  def new
  end

  def verify

  end

  def create
    user = User.find_or_create_by_uid(auth['uid']) do |u|
      u.info = auth['info']['name']
      u.email = auth['info']['email']
    end
    session[:user_id] = user.id
    redirect_to '/mechanics'
  end

  def auth
    request.env['omniauth.auth']
  end

  def destroy
    session.destroy
    redirect_to '/'
  end

end