class PagesController < ApplicationController
  caches_page :index
  
  def index
    @projects = Project.recent
  end
  
  def thank_you
    
  end
  
  def contact_failed
    
  end
end
