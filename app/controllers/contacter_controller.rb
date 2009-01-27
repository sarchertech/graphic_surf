class ContacterController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :contact
  
  def contact
    if Contacter.deliver_contact(params[:contact])
      redirect_to :controller => 'pages', :action => 'thank_you'
    else
      redirect_to :controller => 'pages', :action => 'contact_failed'
    end  
  end
end