require 'rails_helper'

RSpec.describe DeviseController, regressor: true do
  # === Routes (REST) ===

  # === Callbacks (Before) ===
  it { is_expected.to use_before_filter(:assert_is_devise_resource!) }
  it { is_expected.to use_before_filter(:verify_authenticity_token) }
  it { is_expected.to use_before_filter(:set_xhr_redirected_to) }
  it { is_expected.to use_before_filter(:set_request_method_cookie) }
  # === Callbacks (After) ===
  it { is_expected.to use_after_filter(:verify_same_origin_request) }
  it { is_expected.to use_after_filter(:abort_xdomain_redirect) }
  # === Callbacks (Around) ===
end
