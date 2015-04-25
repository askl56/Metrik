require 'rails_helper'

describe RegisteredApplicationsController, type: :controller do
  describe 'GET #index' do
    context 'with valid credentials' do
      it "has a 200 status code" do
        sign_in
        get :index
        expect(response.status).to eq(200)
      end

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
        expect(RegisteredApplication.count).to eq(1)
      end

      it 'redirects to the "show" action for the new application' do
        sign_in
        post :create, registered_application: attributes_for(:registered_application)
        expect(response).to redirect_to RegisteredApplication.first
      end
    end

    context "with invalid attributes" do
      it "does not create the registered_application" do
        sign_in
        expect{
          post :create, registered_application: { name: "" }
        }.to_not change(RegisteredApplication, :count)

      end

      it 'renders the "new" view' do
        sign_in
        post :create, registered_application: { name: "", url: "" }
        expect(response).to render_template :new
      end
    end

    context "JSON" do
      context "with valid attributes" do
        it 'creates the application' do
          sign_in
          post :create, registered_application: attributes_for(:registered_application), format: :json
          expect(RegisteredApplication.count).to eq(1)
        end

        it "responds with 201" do
          sign_in
          post :create, registered_application: attributes_for(:registered_application), format: :json
          expect(response).to have_http_status(201)
        end
      end

      context "with invalid attributes" do
        it "does not create the app" do
          sign_in
          post :create, registered_application: attributes_for(:registered_application, name: nil), format: :json
          expect(RegisteredApplication.count).to eq(0)
        end

        it "responds with 422" do
          sign_in
          post :create, registered_application: attributes_for(:registered_application, name: nil), format: :json
          expect(response).to have_http_status(422)
        end
      end
    end
  end

  describe 'PATCH #update' do
    before :each do
      @registered_application = create(:registered_application,
                                       name: 'Google',
                                       url: 'http://google.com')
    end

    context "valid attributes" do
      it "locates the requested @registered_application" do
        patch :update, id: @registered_application, registered_application: attributes_for(:registered_application)
        expect(assigns(:registered_application)).to eq(@registered_application)
      end

      it "changes @registered_application's attributes" do
        sign_in
        patch :update, id: @registered_application,
          registered_application: attributes_for(:registered_application,
                                                 name: 'Facebook',
                                                 url: 'http://facebook.com')
          @registered_application.reload
        expect(@registered_application.name).to eq('Facebook')
        expect(@registered_application.url).to eq('http://facebook.com')
      end

      it "redirects to the updated application" do
        sign_in
        patch :update, id: @registered_application, registered_application: attributes_for(:registered_application)
        expect(response).to redirect_to @registered_application
      end
    end

    context "with invalid attributes" do
      it "does not change @registered_application's attributes" do
        sign_in
        patch :update, id: @registered_application,
          registered_application: attributes_for(:registered_application,
                                                 name: 'Facebook',
                                                 url: nil)
          @registered_application.reload
        expect(@registered_application.name).to_not eq('Facebook')
        expect(@registered_application.url).to eq('http://google.com')
      end

      it "re-renders the edit template" do
        sign_in
        patch :update, id: @registered_application,
          registered_application: attributes_for(:registered_application,
                                                 name: nil,
                                                 url: nil)
          expect(response).to render_template :edit
      end
    end

    context "JSON" do
      context "with valid attributes" do
        it 'locates the requested @registered_application' do
          sign_in
          patch :update, id: @registered_application, registered_application: attributes_for(:registered_application), format: :json
          expect(assigns(:registered_application)).to eq(@registered_application)
        end

        it "changes @registered_application's attributes" do
          sign_in
          patch :update, id: @registered_application,
            registered_application: attributes_for(:registered_application,
                                                   name: 'Facebook',
                                                   url: 'http://facebook.com'), format: :json
          @registered_application.reload
          expect(@registered_application.name).to eq('Facebook')
          expect(@registered_application.url).to eq('http://facebook.com')
        end

        it "redirects to the updated application with 200 status" do
          sign_in
          patch :update, id: @registered_application, registered_application: attributes_for(:registered_application), format: :json
          expect(response).to have_http_status(200)
        end
      end

      context "with invalid attributes" do
        it "does not change @registered_application's attributes" do
          sign_in
          patch :update, id: @registered_application,
            registered_application: attributes_for(:registered_application,
                                                   name: 'Facebook',
                                                   url: nil), format: :json
          @registered_application.reload
          expect(@registered_application.name).to_not eq('Facebook')
          expect(@registered_application.url).to eq('http://google.com')
        end

        it "responds with 422" do
          sign_in
          patch :update, id: @registered_application,
            registered_application: attributes_for(:registered_application,
                                                   name: nil,
                                                   url: nil), format: :json
          expect(response).to have_http_status(422)
        end
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @registered_application = create(:registered_application)
    end

    it "deletes the application" do
      sign_in
      expect{
        delete :destroy, id: @registered_application
      }.to change(RegisteredApplication, :count).by(-1)
    end

    it "redirects to registered_application#index" do
      sign_in
      delete :destroy, id: @registered_application
      expect(response).to redirect_to registered_applications_path
    end

    context "JSON DESTROY" do
      it "deletes the application" do
        sign_in
        expect{
          delete :destroy, id: @registered_application, format: :json
        }.to change(RegisteredApplication, :count).by(-1)
      end

      it "responds with 204" do
        sign_in
        delete :destroy, id: @registered_application, format: :json
        expect(response).to have_http_status(204)
      end
    end
  end
  describe "Guest Access" do
    describe "GET #NEW" do
      it "requires login" do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "GET #EDIT" do
      it "requires login" do
        foo = create(:registered_application)
        get :edit, id: foo
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "POST #CREATE" do
      it "requires login" do
        post :create, id: create(:registered_application),
          registered_application: attributes_for(:registered_application)
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "PUT #UPDATE" do
      it "requires login" do
        put :update, id: create(:registered_application),
          registered_application: attributes_for(:registered_application)
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "DELETE #DESTROY" do
      it "requires login" do
        delete :destroy, id: create(:registered_application)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
