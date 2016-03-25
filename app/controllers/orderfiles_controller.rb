class OrderfilesController < ApplicationController
  before_action :set_orderfile, only: [:show, :edit, :update, :destroy]

  # GET /orderfiles
  # GET /orderfiles.json
  def index
    @orderfiles = Orderfile.all
  end

  # GET /orderfiles/1
  # GET /orderfiles/1.json
  def show
  end

  # GET /orderfiles/new
  def new
    @orderfile = Orderfile.new
  end

  # GET /orderfiles/1/edit
  def edit
  end

  # POST /orderfiles
  # POST /orderfiles.json
  def create
    
    @orderfile = Orderfile.import(params[:file])
    
    respond_to do |format|
        format.html { redirect_to orderfiles_path, notice: 'Order file was successfully loaded.' }
        format.json { render :show, status: :created, location: @orderfile }

    end
  end
  
  # PATCH/PUT /orderfiles/1
  # PATCH/PUT /orderfiles/1.json
  def update
    respond_to do |format|
      if @orderfile.update(orderfile_params)
        format.html { redirect_to @orderfile, notice: 'Orderfile was successfully updated.' }
        format.json { render :show, status: :ok, location: @orderfile }
      else
        format.html { render :edit }
        format.json { render json: @orderfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orderfiles/1
  # DELETE /orderfiles/1.json
  def destroy
    @orderfile.destroy
    respond_to do |format|
      format.html { redirect_to orderfiles_url, notice: 'Orderfile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orderfile
      @orderfile = Orderfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orderfile_params
      params.fetch(:orderfile, {})
      params.require(:orderfile).permit(:projectcode, :projectname, :orderno, :orderdate, 
      :suppliername, :orderitem, :orderqty, :id)
    end
    
end
