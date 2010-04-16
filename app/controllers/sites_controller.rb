class SitesController < ApplicationController
  layout 'contable_site'
  
  #Renders the index page
  def index
    redirect_to :dashboard and return if(signed_in?)
  end
end
