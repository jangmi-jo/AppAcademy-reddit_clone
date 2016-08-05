class SessionsController < ApplicationController

  def create
    user = User.find_by_credentials(user_params[:username], user_params[:password])
    if user.nil?
      flash.now[:errors] ||= []
      flash.now[:errors] += user.errors.full_messages
      render :new
    else
      login(user)
      redirect_to subs_url
    end
  end

  def destroy
    logout
    redirect_to subs_url
  end

end
