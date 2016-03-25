class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :orderno
      t.datetime :orderdate
      t.string :suppliername
      t.string :orderstatus
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
