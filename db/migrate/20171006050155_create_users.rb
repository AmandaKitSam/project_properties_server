class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.text :userPhoto
      t.text :name
      t.text :email
      t.text :location
      t.string :password_digest
      t.boolean :admin

      t.timestamps
    end
  end
end
