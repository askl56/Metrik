require 'rails_helper'

RSpec.describe API::EventsController, regressor: true do
  # === Routes (REST) ===
  it { should route(:post, '/api/events').to('api/events#create', {:format=>:json}) } 
  # === Callbacks (Before) ===
  it { should use_before_filter(:set_xhr_redirected_to) }
	it { should use_before_filter(:set_request_method_cookie) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_same_origin_request) }
	it { should use_after_filter(:abort_xdomain_redirect) }
  # === Callbacks (Around) ===
  
end