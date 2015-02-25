require 'rails_helper'

RSpec.describe "localizations/test_import", :type => :view do
  it "renders test_import form" do
    render

    assert_select "form[action=?][method=?]", import_localizations_path, "post" do

      assert_select "textarea#localizations_list[name=?]", "localizations_list"
      
    end
  end
end