class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: %i[show update destroy add_user remove_user]

  def index
    events = Event.all
    render json: events
  end

  def show
    if @event.image.attached?
      render json: @event.as_json.merge(image_url: url_for(@event.image))
    else
      render json: @event
    end
  end

  def create
    event = Event.new(event_params)
    if event.save
      render json: event, status: :created
    else
      render json: { errors: event.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: { errors: @event.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    head :no_content
  end

  def add_user
    user = User.find_by(id: params[:user_id])
    if user
      @event.users << user unless @event.users.include?(user)
      render json: { message: 'User added to event successfully' }, status: :ok
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end

  def remove_user
    user = User.find_by(id: params[:user_id])
    if user && @event.users.include?(user)
      @event.users.delete(user)
      render json: { message: 'User removed from event successfully' }, status: :ok
    else
      render json: { error: 'User not found in event' }, status: :not_found
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Event not found' }, status: :not_found
  end

  def event_params
    params.require(:event).permit(:title, :description, :image)
  end
end