class SessionsController < ApplicationController

  skip_before_filter :login_required, :only => %w(new create)

  layout 'login'

  def new
  end

  def create
    subscriber = Subscriber.authenticate(params[:sessions][:login], params[:sessions][:password])
    if subscriber
      session[:subscriber_id] = subscriber.id
      redirect_to_target_or_default root_url
    else
      flash.now[:alert] = "Invalid login or password."
      render 'new'
    end
  end

  def destroy
    session[:subscriber_id] = nil
    redirect_to root_url, :notice => "You have been logged out."
  end

end
