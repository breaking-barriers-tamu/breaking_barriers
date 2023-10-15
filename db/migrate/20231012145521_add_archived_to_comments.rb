class AddArchivedToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :archived, :boolean, default: false
  end
end
