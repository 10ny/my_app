class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def edit
    @contact = Contact.new(contact_params)
    render "edit", status: :unprocessable_entity
  end

  def confirm
    @contact = Contact.new(contact_params)
    if @contact.valid?
      render "confirm", status: :unprocessable_entity
    else
      render "new", status: :unprocessable_entity
    end
  end

  def thanks
    @contact = Contact.new(contact_params)
    ContactMailer.contact_mail(@contact).deliver #contact_mailはmailerで定義
    render "thanks", status: :unprocessable_entity
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :subject, :content)
    end
end
