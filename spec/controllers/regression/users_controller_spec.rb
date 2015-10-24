require 'rails_helper'

RSpec.describe UsersController, regressor: true do
  # === Routes (REST) ===
  it { is_expected.to route(:get, '/users').to('users#index', {}) }
  it { is_expected.to route(:get, '/users/1').to('users#show', id: "1") }
  it { is_expected.to route(:patch, '/users/1').to('users#update', id: "1") }
  it { is_expected.to route(:delete, '/users/1').to('users#destroy', id: "1") }
  # === Callbacks (Before) ===
  it { is_expected.to use_before_filter(:verify_authenticity_token) }
  it { is_expected.to use_before_filter(:set_xhr_redirected_to) }
  it { is_expected.to use_before_filter(:set_request_method_cookie) }
  it { is_expected.to use_before_filter(:authenticate_user!) }
  # === Callbacks (After) ===
  it { is_expected.to use_after_filter(:verify_same_origin_request) }
  it { is_expected.to use_after_filter(:abort_xdomain_redirect) }
  it { is_expected.to use_after_filter(:verify_authorized) }
  # === Callbacks (Around) ===
end
