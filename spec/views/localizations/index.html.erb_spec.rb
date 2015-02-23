require 'rails_helper'

RSpec.describe "localizations/index", :type => :view do
  before(:each) do
    assign(:localizations, [
      Localization.create!(
        :path => "Path",
        :value => "Value",
        :locale => "Locale"
      ),
      Localization.create!(
        :path => "other.Path",
        :value => "Value",
        :locale => "Locale"
      )
    ])
  end

  it "renders a list of localizations" do
    render
    assert_select "tr>td", :text => "Path".to_s, :count => 1
    assert_select "tr>td", :text => "other.Path".to_s, :count => 1
    assert_select "tr>td", :text => "Value".to_s, :count => 2
    assert_select "tr>td", :text => "Locale".to_s, :count => 2
  end
end
