class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest # for storing encrypted password (specific to b-crypt)
      t.string :remember_token
      t.timestamps
    end
  end
end
