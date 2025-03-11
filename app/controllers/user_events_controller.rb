class UserEventsController < ApplicationController
  def create
    user_event = UserEvent.new(user_event_params)
    if user_event.save
      render json: user_event, status: :created
    else
      render json: { errors: user_event.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_event_params
    params.permit(:user_id, :event_id)
  end
end
