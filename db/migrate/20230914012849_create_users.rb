class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      # Database Authenticatable
      # t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :avatar_url
      t.string :uid
      t.string :provider

      ## Rememberable
      t.datetime :remember_created_at

      t.integer :access_level, default: 0
      t.string :first_name
      t.string :last_name
      t.string :major
      t.integer :year
      t.string :phone_number
      t.boolean :registration_completed, default: false
      t.string :email

      t.timestamps
    end
  end
end
