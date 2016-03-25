class CreateOrderfiles < ActiveRecord::Migration
  def change
    drop_table :orderfiles
     
     
    create_table :orderfiles do |t|
      t.string :projectcode
      t.string :projectname
      t.string :orderno
      t.string :orderdate
      t.string :suppliername
      t.string :orderitem
      t.string :orderqty

      t.timestamps null: false
    end
  end
end
