require 'rails_helper'

RSpec.describe "localizations/new", :type => :view do
  before(:each) do
    assign(:localization, Localization.new(
      :path => "MyString",
      :value => "MyString",
      :locale => "MyString"
    ))
  end

  it "renders new localization form" do
    render

    assert_select "form[action=?][method=?]", localizations_path, "post" do

      assert_select "input#localization_path[name=?]", "localization[path]"

      assert_select "input#localization_value[name=?]", "localization[value]"

      assert_select "input#localization_locale[name=?]", "localization[locale]"
    end
  end
end
