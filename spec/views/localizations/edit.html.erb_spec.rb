require 'rails_helper'

RSpec.describe "localizations/edit", :type => :view do
  before(:each) do
    @localization = assign(:localization, Localization.create!(
      :path => "MyString",
      :value => "MyString",
      :locale => "MyString"
    ))
  end

  it "renders the edit localization form" do
    render

    assert_select "form[action=?][method=?]", localization_path(@localization), "post" do

      assert_select "input#localization_path[name=?]", "localization[path]"

      assert_select "input#localization_value[name=?]", "localization[value]"

      assert_select "input#localization_locale[name=?]", "localization[locale]"
    end
  end
end
