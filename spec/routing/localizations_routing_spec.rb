require "rails_helper"

RSpec.describe LocalizationsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/localizations").to route_to("localizations#index")
    end

    it "routes to #new" do
      expect(:get => "/localizations/new").to route_to("localizations#new")
    end

    it "routes to #show" do
      expect(:get => "/localizations/1").to route_to("localizations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/localizations/1/edit").to route_to("localizations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/localizations").to route_to("localizations#create")
    end

    it "routes to #update" do
      expect(:put => "/localizations/1").to route_to("localizations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/localizations/1").to route_to("localizations#destroy", :id => "1")
    end
    
    it "routes to #import" do
      expect(:post => "/localizations/import").to route_to("localizations#import")
    end

  end
end
