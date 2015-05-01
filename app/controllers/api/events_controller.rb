class API::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @events = Event.all
    render json: @events, status: :ok
  end

  def show
    @event = Event.find(params[:id])
    render json: @event
  end

  def create

    registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])
    not_found if RegisteredApplication.nil? or !RegisteredApplication.verified

    if registered_application
      @event = Event.new(event_params)
      @event.url = url
      if @event.save
        render json: @event, status: :created
      else
        render @event.errors, status: :unprocessable_entity
      end
    end
  end


  private

  def event_params
    unknown_property_keys = params[:event][:meta].try(:keys)
    params.require(:event).permit(:name, { meta: unknown_property_keys })
  end
end
