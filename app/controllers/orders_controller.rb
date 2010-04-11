class OrdersController < ApplicationController
  protect_from_forgery :only => :pay
  before_filter :fetch_product_presentations, :only => [:edit, :new, :create]
  # GET /orders
  # GET /orders.xml
  def index
    @orders = Order.paginate(:page => params[:page], :conditions => ["status in ('Active', 'Debt')"], :order => 'expiration_date asc, status desc')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.xml
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.xml
  def new
    @order = Order.new
    @order.build_client
    @order.order_product_presentations.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.xml
  def create
    @order = Order.new(params[:order])

    respond_to do |format|
      if @order.save
        notice('created', Order.human_name)
        format.html { redirect_to(@order) }
        format.xml  { render :xml => @order, :status => :created, :location => @order }
      else
        error('no_create')
        format.html { render :action => "new" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.xml
  def update
    params[:order][:existing_order_product_presentations_attributes] ||= {}
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        notice('updated', Order.human_name)
        format.html { redirect_to(@order) }
        format.xml  { head :ok }
      else
        error('no_update')
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.xml
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to(orders_url) }
      format.xml  { head :ok }
    end
  end

  # GET /orders
  # GET /orders.xml
  def paid
    @orders = Order.paginate(:page => params[:page], :conditions => ["status = 'Paid'"], :order => :expiration_date)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orders }
    end
  end
  
  def pay
    raise "Only ajax request." if !request.xhr?
    begin
      @order = Order.find(params[:id])
      @order.status = 'Paid'
      if @order.save
        head :ok
      else
        head :unprocessable_entity
      end
    rescue
      head :unprocessable_entity
    end
  end

  private

  def fetch_product_presentations
    @product_presentations = ProductPresentation.all
  end
end
