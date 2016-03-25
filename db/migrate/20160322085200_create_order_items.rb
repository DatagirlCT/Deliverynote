class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.string :itemdescription
      t.integer :orderqty
      t.integer :receivedqty
      t.integer :remainingqty
      t.string :receivedby
      t.references :order, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
