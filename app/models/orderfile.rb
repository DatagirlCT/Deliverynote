class Orderfile < ActiveRecord::Base
    
  require 'csv'

  def self.import(file)
    
      Orderfile.delete_all
      
      CSV.foreach(file.path, headers: true) do |row|
  
          orderfile_hash = row.to_hash # exclude the price field
          # orderfile = Orderfile.where(id: orderfile_hash["id"])
  
          Orderfile.create!(orderfile_hash)
       
      end # end CSV.foreach

    
  end # end self.import(file)
  
end