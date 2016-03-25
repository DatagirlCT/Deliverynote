class DropCsvfile < ActiveRecord::Migration
  def change
     drop_table :csvfile
  end
end
