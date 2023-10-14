class AddStatusAndOfficerToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :event_enabled, :boolean
    add_column :events, :officer_in_charge, :integer
  end
end
