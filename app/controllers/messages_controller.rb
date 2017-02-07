class MessagesController < ApplicationController
  before_action :set_event, :only => [ :show, :edit, :update, :destroy]
  def index
    @messages = Message.all
    @message = Message.new
  end

  def create
    @message = Message.new(event_params)
    @message.save

    redirect_to :action => :index
  end

  def update
    @message.update(event_params)

    redirect_to :action => :show, :id => @message
  end

  private
  def event_params
    params.require(:message).permit(:test)
  end

  def set_event
    @message = Message.find(params[:id])
  end
end
