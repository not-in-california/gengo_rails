require 'rails_helper'

RSpec.describe Localization, :type => :model do
  describe "validations" do
    it { should validate_presence_of(:path) }
    it { should validate_presence_of(:value) }
    it { should validate_presence_of(:locale) }
  end
end
