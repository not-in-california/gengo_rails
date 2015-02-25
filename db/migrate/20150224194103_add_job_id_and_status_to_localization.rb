class AddJobIdAndStatusToLocalization < ActiveRecord::Migration
  def change
    add_column :localizations, :job_id, :string
    add_column :localizations, :status, :string
  end
end
