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
      @localization_factory = LocalizationFactory.new.from_list(@localizations_list)
    end
    
    it "should assign all passed localizations" do
      expect(@localization_factory.localizations).to eq(@localizations_list)
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
  
  describe "export" do
    before do
      2.times { create(:localization, status: "approved") }
      2.times { create(:localization, status: "new") }
      2.times { create(:localization) }
    end
    
    it "should get only approved localizations by default" do
      expect(LocalizationFactory.export).to eq(Localization.where(status: "approved").all)
    end
    
    it "should allow to filter by locale" do
      2.times { create(:localization, status: "approved", locale: "pt")}
      expect(LocalizationFactory.export(locale: "en")).to eq(Localization.where(status: "approved").where(locale: "en").all)
    end
    
    it "should allow to filter by path" do
      2.times { |i| create(:localization, status: "approved", path: "path.to...", locale: "l#{i}")}
      expect(LocalizationFactory.export(path: "path.to...")).to eq(Localization.where(status: "approved").where(path: "path.to...").all)
    end
    
    it "should allow to filter by value" do
      2.times { create(:localization, status: "approved", value: "val")}
      expect(LocalizationFactory.export(value: "val")).to eq(Localization.where(status: "approved").where(value: "val").all)
    end
    
    it "should not allow to filter by other fields" do
      t = Time.now
      2.times { create(:localization, status: "approved", updated_at: t)}
      expect(LocalizationFactory.export(updated_at: t)).to eq(Localization.where(status: "approved").all)
    end
  end
end