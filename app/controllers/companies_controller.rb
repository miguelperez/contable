class CompaniesController < ApplicationController
  
  def index
    @companies = Company.paginate(:page => params[:page], :conditions => ["user_id = ?", current_user.id])
  end
  
   # GET /orders/new
  # GET /orders/new.xml
  def new
    @company = current_user.companies.build
   
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order }
    end
  end
  
  def create
    @company = current_user.companies.build(params[:company])

    respond_to do |format|
      if @company.save
        notice('created', Company.human_name)
        format.html { redirect_to(@company) }
        format.xml  { render :xml => @company, :status => :created, :location => @company }
      else
        error('no_create')
        format.html { render :action => "new" }
        format.xml  { render :xml => @company.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def show
    @company = current_user.companies.find(params[:id])
  end
  
  def edit
    @company = current_user.companies.find(params[:id])
  end
  
  def update
    @company = current_user.companies.find(params[:id])
    
    respond_to do |format|
      if @company.update_attributes(params[:company])
        notice('updated', Company.human_name)
        format.html { redirect_to(@company) }
        format.xml  { render :xml => @company, :status => :created, :location => @company }
      else
        error('no_update')
        format.html { render :action => "new" }
        format.xml  { render :xml => @company.errors, :status => :unprocessable_entity }
      end
    end
  end
end
