class CreateMechanics < ActiveRecord::Migration
  def change
    create_table :mechanics do |t|
      t.integer :uid
      t.string :name
      t.string :username
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
