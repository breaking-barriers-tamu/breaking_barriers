class AddParticipatingToEventLogs < ActiveRecord::Migration[7.0]
  def change
    add_column :event_logs, :participating, :boolean, default: true
  end
end
