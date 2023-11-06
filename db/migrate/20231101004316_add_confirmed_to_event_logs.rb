class AddConfirmedToEventLogs < ActiveRecord::Migration[7.0]
  def change
    add_column :event_logs, :confirmed, :boolean, default: false
  end
end
