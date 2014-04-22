class ContactsController < ApplicationController

  def index
    @contacts = Contact.where(user_id: current_user.id)
  end
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
