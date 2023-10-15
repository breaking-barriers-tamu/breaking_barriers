class RemoveBodyFromAnnouncements < ActiveRecord::Migration[7.0]
  def change
    remove_column :announcements, :body, :string
  end
end
