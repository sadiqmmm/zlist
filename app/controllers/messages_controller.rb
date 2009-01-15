class MessagesController < ApplicationController
  before_filter :find_message, :only => %w(show edit update destroy)

  def index
    @messages = Message.all
  end

  def show
  end

  def new
    @messages = Message.new
  end

  def edit
  end

  def create
    @message = Message.new(params[:message])
    if @message.save
      flash[:notice] = 'Message was successfully created.'
      redirect_to(@message)
    else
      flash.now[:warning] = 'There was a problem creating the message.'
      render :action => "new"
    end
  end

  def update
    if @message.update_attributes(params[:message])
      flash[:notice] = 'Message was successfully updated.'
      redirect_to(@message)
    else
      flash.now[:warning] = 'There was a problem updating the message.'
      render :action => "edit" 
    end
  end

  def destroy
    @message.destroy
    flash[:notice] = "The message was deleted."
    redirect_to(messages_url)
  end

  protected
  
  def find_message
    @message = Message.find(params[:id])
  end

end
