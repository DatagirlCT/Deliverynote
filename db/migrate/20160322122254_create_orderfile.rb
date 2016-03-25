class CreateOrderfile < ActiveRecord::Migration
  def change
    create_table :orderfiles do |t|
      t.string :projectcode
      t.string :projectname
      t.string :orderno
      t.string :orderdate
      t.string :suppliername
      t.string :orderitem
      t.string :orderqty
    end
  end
end
