require 'rails_helper'

RSpec.describe Localization, :type => :model do
  describe "validations" do
    it { should validate_presence_of(:path) }
    it { should validate_presence_of(:value) }
    it { should validate_presence_of(:locale) }
    it { should validate_uniqueness_of(:path).scoped_to(:locale) }
    it { should serialize(:data) }
  end
  
  describe "#translated_value" do
    before do
      @localization = FactoryGirl.create(:localization)
    end
    
    it "aliases to body_tgt (translated_value)" do
      expect(@localization.translated_value).to eq @localization.data["body_tgt"]
    end
  end
  
  context "scopes" do
    describe "approved" do
      it "should return only approved ones" do
        @localization = create(:localization, status: "approved")
        create(:localization, status: "new")
        create(:localization, status: nil)
        expect(Localization.approved).to match_array([@localization])
      end
    end
  end
end
