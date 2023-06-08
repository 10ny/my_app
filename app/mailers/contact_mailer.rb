class ContactMailer < ApplicationMailer

  def contact_mail(contact)
    @contact = contact
    mail  to: ENV["CONTACT_EMAIL"], subject: "Serveへの問い合わせ"
  end
end
