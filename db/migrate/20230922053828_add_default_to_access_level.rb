class AddDefaultToAccessLevel < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :access_level, 0
  end
end
