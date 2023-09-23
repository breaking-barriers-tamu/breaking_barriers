class CreateEventLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :event_logs do |t|
      t.integer :hourlog_id
      t.integer :user_id
      t.integer :event_id
      t.float :hours

      t.timestamps
    end
  end
end
