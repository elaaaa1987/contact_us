class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    redirect_to new_contact_path
  end


  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      respond_to do |format|
        format.html { redirect_to new_contact_path, notice: 'Thanks for contacting us, we will get back to you shortly.' }
        format.json { render :show, status: :created, location: @contact }
      end
    else
      flash[:alert] = @contact.errors.full_messages.join("<br/>").html_safe
      render :new
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :email, :message)
    end
end
