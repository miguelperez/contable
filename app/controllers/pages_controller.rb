class PagesController < ApplicationController
  skip_before_filter :authenticate, :only => [:index]

  #Gets all the information for the dashboard of the application
  def dashboard
    
  end

  #Renders the index page of the application.
  def index

  end
end
