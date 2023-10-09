class CreateAnnouncements < ActiveRecord::Migration[7.0]
  def change
    create_table :announcements do |t|
      t.string :title
      t.string :body
      t.datetime :timestamp
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
