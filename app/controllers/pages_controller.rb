class PagesController < ApplicationController
  def index
    @projects = Project.recent
  end
  
  def thank_you
    
  end
  
  def contact_failed
    
  end
end
