class CreateLocalizations < ActiveRecord::Migration
  def change
    create_table :localizations do |t|
      t.string :path
      t.string :value
      t.string :locale

      t.timestamps
    end
  end
end
