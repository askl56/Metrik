class API::V1::EventsController < API::ApiController
  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

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

  def cors_set_access_control_headers
    origin = request.env['HTTP_ORIGIN']
    app = RegisteredApplication.find_by(url: origin)

    if app && ( app.verified || AppVerifier.new(app).verified? )
      headers['Access-Control-Allow-Origin'] = origin
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
      headers['Access-Control-Max-Age'] = "1728000"
    end
  end
end
