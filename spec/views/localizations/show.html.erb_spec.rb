require 'rails_helper'

RSpec.describe "localizations/show", :type => :view do
  before(:each) do
    @localization = assign(:localization, Localization.create!(
      :path => "Path",
      :value => "Value",
      :locale => "Locale"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Path/)
    expect(rendered).to match(/Value/)
    expect(rendered).to match(/Locale/)
  end
end
