class Order < ActiveRecord::Base
    
  belongs_to :project
  has_many :orderitems
  


  
end
