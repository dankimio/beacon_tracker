class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :name, null: false
      t.string :api_token, null: false

      t.timestamps
    end
    add_index :users, :api_token, unique: true
    add_index :users, :email, unique: true
  end
end
