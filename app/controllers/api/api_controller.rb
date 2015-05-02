class API::ApiController < ActionController::Base
  skip_before_action :verify_authenticity_token

  respond_to :json

  private

  def permission_denied_error
    error(403, 'Permission Denied!')
  end

  def error(status, message = 'Something went wrong')
    response = {
      response_type: "ERROR",
      message: message
    }

    render json: response.to_json, status: status
  end

end
