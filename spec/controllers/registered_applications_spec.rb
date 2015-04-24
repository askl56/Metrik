require 'rails_helper'

describe RegisteredApplicationsController, type: :controller do
  describe 'GET #index' do
    context 'with valid credentials' do
      it 'lists registered applications' do
        sign_in
        app = create(:registered_application, name: 'Google')
        get :index
        expect(assigns(:registered_applications)).to match_array([app])
      end

      it 'renders the :index template' do
        sign_in
        get :index
        expect(response).to render_template :index
      end
    end

    context 'with invalid credentials' do
      it 'blocks unauthenticated access' do
        sign_in nil
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #SHOW' do
    it "renders the :show template for registered applications" do
      sign_in
      app = create(:registered_application)
      get :show, id: app.id
      expect(response).to render_template :show
    end
  end

  describe "GET #NEW" do
    it "assigns a new app to be @registered_application" do
      sign_in
      get :new
      expect(assigns(:registered_applications)).to be_a_new(RegisteredApplication)
    end
  end

  describe "POST #CREATE" do
    context "with valid attributes" do
      it "creates the registered_application" do
        sign_in
        post :create, registered_application: attributes_for(:registered_application)
        expect(response).to eq(1)
      end
    end
  end
end
