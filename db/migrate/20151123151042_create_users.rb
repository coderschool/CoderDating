class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.timestamps null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :name, null: false
      t.string :image_url

      t.index :email
    end
  end
end
