require 'rails_helper'

RSpec.describe RegisteredApplicationsController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/registered_applications').to('registered_applications#index', {}) }
	it { should route(:get, '/registered_applications/1').to('registered_applications#show', {:id=>"1"}) }
	it { should route(:get, '/registered_applications/new').to('registered_applications#new', {}) }
	it { should route(:get, '/registered_applications/1/edit').to('registered_applications#edit', {:id=>"1"}) }
	it { should route(:post, '/registered_applications').to('registered_applications#create', {}) } 
	it { should route(:patch, '/registered_applications/1').to('registered_applications#update', {:id=>"1"}) } 
	it { should route(:delete, '/registered_applications/1').to('registered_applications#destroy', {:id=>"1"}) } 
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
	it { should use_before_filter(:set_xhr_redirected_to) }
	it { should use_before_filter(:set_request_method_cookie) }
	it { should use_before_filter(:set_registered_application) }
	it { should use_before_filter(:authenticate_user!) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_same_origin_request) }
	it { should use_after_filter(:abort_xdomain_redirect) }
  # === Callbacks (Around) ===
  
end