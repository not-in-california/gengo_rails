require 'rails_helper'

RSpec.describe Localization, :type => :model do
  describe "validations" do
    it { should validate_presence_of(:path) }
    it { should validate_presence_of(:value) }
    it { should validate_presence_of(:locale) }
    it { should validate_uniqueness_of(:path).scoped_to(:locale) }
  end
end
