class AddDataToLocalization < ActiveRecord::Migration
  def change
    add_column :localizations, :data, :text
  end
end
