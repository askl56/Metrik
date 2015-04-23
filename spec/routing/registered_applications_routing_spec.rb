require "rails_helper"

describe RegisteredApplicationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/registered_applications").to route_to("registered_applications#index")
    end

    it "routes to #new" do
      expect(:get => "/registered_applications/new").to route_to("registered_applications#new")
    end

    it "routes to #show" do
      expect(:get => "/registered_applications/1").to route_to("registered_applications#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/registered_applications/1/edit").to route_to("registered_applications#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/registered_applications").to route_to("registered_applications#create")
    end

    it "routes to #update" do
      expect(:put => "/registered_applications/1").to route_to("registered_applications#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/registered_applications/1").to route_to("registered_applications#destroy", :id => "1")
    end

  end
end
