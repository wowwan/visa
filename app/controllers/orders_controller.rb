class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all

    respond_to do |format|
    format.html
    format.json
  end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    session[:order_params] ||= {}
    @order = Order.new(session[:order_params])
    @order.current_step = session[:order_step]
    @visas = Visa.all

  end

  # GET /orders/1/edit
  def edit

  end

  # POST /orders
  # POST /orders.json
  def create
        @visas = Visa.all

    session[:order_params].deep_merge!(params[:order]) if params[:order]
    @order = Order.new(session[:order_params])
    @order.current_step = session[:order_step]
        @order.passports.build

    if @order.valid?
      if params[:back_button]
        @order.previous_step
      elsif @order.last_step?
        @order.save if @order.all_valid?
      else
        @order.next_step
      end
      session[:order_step] = @order.current_step
    end
    if @order.new_record?
      render "new"
    else
      session[:order_step] = session[:order_params] = nil
      flash[:notice] = "Order saved!"
      redirect_to @order
    end
  end
  
  
  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
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
      params.require(:order).permit(:visa, :fast_track, :private_letter, :amount, :speed, 
      :border_point, :entry_date, :email, :customer_name, :phone, :passport_number, :passport_name, :nationality, :passport_issued, :passport_end, 
      :gender, :birthday, :qty, :status, :passports_attributes => [:name, :nationality, :number, :gender, :birthday, :issue_date, :finish_date])
    end
end
