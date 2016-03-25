class Csvfile < ActiveRecord::Base
    
  require 'csv'

  def self.import(file)
    
    Csvfile.delete_all
    
    CSV.foreach(file.path, headers: true) do |row|

      csvfile_hash = row.to_h # exclude the price field
      
      # csvfile = Csvfile.where(id: csvfile_hash["id"])

     
      if csvfile.count == 1
        csvfile.first.update_attributes(csvfile_hash)
      else
        Csvfile.create!(csvfile_hash)
      end # end if !csvfile.nil?
    end # end CSV.foreach
  end # end self.import(file)
  
end