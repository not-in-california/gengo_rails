require 'rails_helper'
require 'localization_factory'

RSpec.describe LocalizationFactory do
  before do
    @valid_localizations = []
    @invalid_localizations = []
    
    5.times do |i|
      localization = { path: "path.#{i}", value: "Value #{i}", locale: "en" }
      @valid_localizations << localization
      @invalid_localizations << localization
      invalid_localization = localization.clone
      invalid_localization.delete(:locale)
      @invalid_localizations << invalid_localization
    end
    
    @localizations_list = @valid_localizations + @invalid_localizations
  end
  
  describe "from_list" do
    before do
      @localization_factory = LocalizationFactory.from_list(@localizations_list)
    end
    
    it "should create all of the five valid_localizations" do
      expect(Localization.count).to eq(5)
    end
    
    context "valid_localizations" do
      it "should create localizations" do
        @valid_localizations.each do |localization|
          expect(Localization.where(localization).exists?).to be_truthy
        end
      end
    
      it "should have the same number" do
        expect(Localization.count).to eq(@valid_localizations.size)
      end
      
      it "should assign created localizations to valid_localizations" do
        expect(Localization.all).to eq(@localization_factory.valid_localizations)
      end
    end
    
    context "invalid_localizations" do
      it "should assign not created localizations" do
        @localization_factory.invalid_localizations do |localization|
          expect(localization.errors.any?).to be_truthy
        end
      end
      
      it "should have the same number" do
        expect(@localization_factory.invalid_localizations.size).to eq(@invalid_localizations.size)
      end
    end
  end
end