class AddDatetimeToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :datetime, :datetime
  end
end
