class Project < ActiveRecord::Base
  
  belongs_to :user
  has_many :orders
  
  def self.find_by_code(project_code)
    where(code: project_code).first
  end

  def self.new_from_lookup(project_code, project_name)
    new_project = new(code: project_code, name: project_name)
    new_project
  end
  
end
