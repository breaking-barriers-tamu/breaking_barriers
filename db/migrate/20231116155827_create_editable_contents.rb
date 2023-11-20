class CreateEditableContents < ActiveRecord::Migration[7.0]
  def change
    create_table :editable_contents do |t|

      t.timestamps
    end
  end
end
