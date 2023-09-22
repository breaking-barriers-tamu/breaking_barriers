class AddRegistrationCompleted < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :registration_completed, :boolean, default: false
  end
end
