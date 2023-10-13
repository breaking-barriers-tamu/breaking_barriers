class RemoveHourlogIdFromEventLogs < ActiveRecord::Migration[7.0]
  def change
    remove_column :event_logs, :hourlog_id, :integer
  end
end
