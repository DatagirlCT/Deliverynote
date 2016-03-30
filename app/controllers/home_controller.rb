class HomeController < ApplicationController
    
  
    def import
        
         @orderfile = Orderfile.all
   

        if Orderfile.import(params[:file])
            redirect_to home_import_path, notice: "Order files imported."
        end
   
    end

  def assigntouser
    @projects = Project.all
    @users = User.all
  end
  
    def index
        @orderfile = Orderfile.all
    end
    
end
