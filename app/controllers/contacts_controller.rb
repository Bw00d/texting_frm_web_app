class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.create(contact_params)
    if @contact.save
      redirect_to new_message_path, notice: "Contact added."
    else
      redirect_to :back, alert: "You messed something up. Try again."
    end
  end


  private
    def contact_params
      params.require(:contact).permit(:name, :number, :user_id)
    end
end
