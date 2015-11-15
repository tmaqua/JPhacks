require "rails_helper"

RSpec.describe PlainsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/plains").to route_to("plains#index")
    end

    it "routes to #new" do
      expect(:get => "/plains/new").to route_to("plains#new")
    end

    it "routes to #show" do
      expect(:get => "/plains/1").to route_to("plains#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/plains/1/edit").to route_to("plains#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/plains").to route_to("plains#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/plains/1").to route_to("plains#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/plains/1").to route_to("plains#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/plains/1").to route_to("plains#destroy", :id => "1")
    end

  end
end
