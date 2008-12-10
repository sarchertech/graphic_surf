class Contacter < ActionMailer::Base
  def contact(contact)
    @recipients   = 'learc83@gmail.com'
    @from         = 'Contact Mailer <mailer@graphicsurf.com>'
    @subject      = 'CLIENT CONTACT'
    @sent_on      = Time.now
    @content_type = 'text/html'
    
    body[:name]    = contact[:name]
    body[:email]   = contact[:email]
    body[:phone]   = contact[:phone]
    body[:content] = contact[:content]
  end
end
