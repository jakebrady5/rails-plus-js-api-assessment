class CreateWorkOrders < ActiveRecord::Migration
  def change
    create_table :work_orders do |t|
      t.string :description
      t.integer :price
      t.integer :job_id
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
