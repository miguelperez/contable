class ProductPresentationsController < ApplicationController
  # GET /product_presentations
  # GET /product_presentations.xml
  def index
    @product_presentations = ProductPresentation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @product_presentations }
    end
  end

  # GET /product_presentations/1
  # GET /product_presentations/1.xml
  def show
    @product_presentation = ProductPresentation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product_presentation }
    end
  end

  # GET /product_presentations/new
  # GET /product_presentations/new.xml
  def new
    @product_presentation = ProductPresentation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product_presentation }
    end
  end

  # GET /product_presentations/1/edit
  def edit
    @product_presentation = ProductPresentation.find(params[:id])
  end

  # POST /product_presentations
  # POST /product_presentations.xml
  def create
    @product_presentation = ProductPresentation.new(params[:product_presentation])

    respond_to do |format|
      if @product_presentation.save
        flash[:notice] = 'ProductPresentation was successfully created.'
        format.html { redirect_to(@product_presentation) }
        format.xml  { render :xml => @product_presentation, :status => :created, :location => @product_presentation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product_presentation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /product_presentations/1
  # PUT /product_presentations/1.xml
  def update
    @product_presentation = ProductPresentation.find(params[:id])

    respond_to do |format|
      if @product_presentation.update_attributes(params[:product_presentation])
        flash[:notice] = 'ProductPresentation was successfully updated.'
        format.html { redirect_to(@product_presentation) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product_presentation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /product_presentations/1
  # DELETE /product_presentations/1.xml
  def destroy
    @product_presentation = ProductPresentation.find(params[:id])
    @product_presentation.destroy

    respond_to do |format|
      format.html { redirect_to(product_presentations_url) }
      format.xml  { head :ok }
    end
  end
end
