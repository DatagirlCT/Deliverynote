class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    
    @orderfile = Orderfile.first
    
    project = Project.where(code: @orderfile.projectcode).first
    
    if project
      @order = Order.create(project: project, orderno: @orderfile.orderno, orderdate: @orderfile.orderdate,
                suppliername: @orderfile.suppliername)
      if @order
        orderfiles = Orderfile.all
 
        orderfiles.each do |o|
          @orderitem = OrderItem.create(order: @order, itemdescription: o.orderitem, 
                orderqty: o.orderqty)
        end

      end
    else
      project = Project.new(code: @orderfile.projectcode, name: @orderfile.projectname, user: current_user)
      if project.save
        @order = Order.create(project: project, orderno: @orderfile.orderno, orderdate: @orderfile.orderdate,
                suppliername: @orderfile.suppliername)
        if @order
          orderfiles = Orderfile.all
   
          orderfiles.each do |o|
            @orderitem = OrderItem.create(order: @order, itemdescription: o.orderitem, 
                  orderqty: o.orderqty)
          end
        end
      end
    end
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to order_items_path, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_items_path, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:orderno, :orderdate, :suppliername, :orderstatus, :project_id)
    end
end
