class ChangeDefaultvalueForEventLogParticipating < ActiveRecord::Migration[7.0]
  def change
    change_column_default :event_logs, :participating, from: true, to: false
  end
end
