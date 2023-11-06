class RemoveDescriptionFromEvents < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :description, :string
  end
end
