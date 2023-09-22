class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.integer :access_level
      t.string :name
      t.string :major
      t.integer :year
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
