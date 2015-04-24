require 'rails_helper'

describe RegisteredApplicationsController, type: :controller do
  describe 'GET #index' do
    it 'lists registered applications' do
      app = create(:registered_application, name: 'Google')
      get :index, letter: 'S'
      expect(assigns(:registered_applications)).to match_array([app])
    end
  end
end
