require "rails_helper"

RSpec.describe LocalizationsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/gengo/localizations").to route_to("localizations#index")
    end

    it "routes to #new" do
      expect(:get => "/gengo/localizations/new").to route_to("localizations#new")
    end

    it "routes to #show" do
      expect(:get => "/gengo/localizations/1").to route_to("localizations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/gengo/localizations/1/edit").to route_to("localizations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/gengo/localizations").to route_to("localizations#create")
    end

    it "routes to #update" do
      expect(:put => "/gengo/localizations/1").to route_to("localizations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/gengo/localizations/1").to route_to("localizations#destroy", :id => "1")
    end
    
    it "routes to #import" do
      expect(:post => "/gengo/localizations/import").to route_to("localizations#import")
    end
    
    it "routes to #test_import" do
      expect(:get => "/gengo/localizations/test_import").to route_to("localizations#test_import")
    end

    it "routes to #update_job" do
      expect(:post => "/gengo/localizations/update_job").to route_to("localizations#update_job")
    end
  end
end
