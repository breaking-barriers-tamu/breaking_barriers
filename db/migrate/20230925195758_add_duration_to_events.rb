class AddDurationToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :duration, :decimal
  end
end
