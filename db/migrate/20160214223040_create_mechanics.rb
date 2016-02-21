class CreateMechanics < ActiveRecord::Migration
  def change
    create_table :mechanics do |t|
      t.integer :uid, limit: 8
      t.string :name

      t.timestamps null: false
    end
  end
end
