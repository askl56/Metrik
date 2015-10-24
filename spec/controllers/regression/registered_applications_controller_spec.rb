require 'rails_helper'

RSpec.describe RegisteredApplicationsController, regressor: true do
  # === Routes (REST) ===
  it { is_expected.to route(:get, '/registered_applications').to('registered_applications#index', {}) }
  it { is_expected.to route(:get, '/registered_applications/1').to('registered_applications#show', id: "1") }
  it { is_expected.to route(:get, '/registered_applications/new').to('registered_applications#new', {}) }
  it { is_expected.to route(:get, '/registered_applications/1/edit').to('registered_applications#edit', id: "1") }
  it { is_expected.to route(:post, '/registered_applications').to('registered_applications#create', {}) }
  it { is_expected.to route(:patch, '/registered_applications/1').to('registered_applications#update', id: "1") }
  it { is_expected.to route(:delete, '/registered_applications/1').to('registered_applications#destroy', id: "1") }
  # === Callbacks (Before) ===
  it { is_expected.to use_before_filter(:verify_authenticity_token) }
  it { is_expected.to use_before_filter(:set_xhr_redirected_to) }
  it { is_expected.to use_before_filter(:set_request_method_cookie) }
  it { is_expected.to use_before_filter(:set_registered_application) }
  it { is_expected.to use_before_filter(:authenticate_user!) }
  # === Callbacks (After) ===
  it { is_expected.to use_after_filter(:verify_same_origin_request) }
  it { is_expected.to use_after_filter(:abort_xdomain_redirect) }
  # === Callbacks (Around) ===
end
