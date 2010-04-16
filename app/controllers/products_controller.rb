class ProductsController < ApplicationController
  before_filter :fetch_ingredients, :only => [:new, :edit]
  # GET /products
  # GET /products.xml
  def index
    @products = Product.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/new
  # GET /products/new.xml
  def new
    @product = Product.new
    @product.product_presentations.build
    @product.formulas.build
    @product.product_presentations.first.formulas.build
    @ingredients = Ingredient.all - @product.ingredients

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
    @product.formulas.build unless @product.formulas
    @ingredients = Ingredient.all - @product.ingredients
  end

  # POST /products
  # POST /products.xml
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        notice('created', Product.human_name)
        format.html { redirect_to(@product) }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        error('no_create')
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        notice('updated', Product.human_name)
        format.html { redirect_to(@product) }
        format.xml  { head :ok }
      else
        error('no_update')
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end
  
  #renders the page for adding ingredients to a product
  def add_ingredients
    @product = Product.find(params[:id])
    @product.formulas.build unless @product.formulas
    @ingredients = Ingredient.all - @product.ingredients
  end

  private

  def fetch_ingredients
    @ingredients = Ingredient.all
  end
end
