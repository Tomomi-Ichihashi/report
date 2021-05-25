class Users::EventsController < ApplicationController
  
  def create
      event = Event.new(event_params)
      event.save
      @events = Event.where(user_id: current_user.id)
  end
  
  def update
      event = Event.find(params[:id])
      event.update(event_params)
      @events = Event.where(user_id: current_user.id)
  end

  def destroy
      event = Event.find(params[:id])
      event.destroy
      @events = Event.where(user_id: current_user.id)
  end
  
  private
  
  def event_params
      params.require(:event).permit(:title, :body, :start, :end, :user_id)
  end
  
end
