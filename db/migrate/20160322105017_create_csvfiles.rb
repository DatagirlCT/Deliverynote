class CreateCsvfiles < ActiveRecord::Migration
  def change
    drop_table :csvfiles
        
    create_table :csvfiles do |t|
      
      t.string :col1
      t.string :col2
      t.string :col3

    end
  end
end
