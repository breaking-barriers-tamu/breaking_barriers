class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.date :date
      t.time :time
      t.string :location
      t.decimal :duration

      t.timestamps
    end
  end
end
