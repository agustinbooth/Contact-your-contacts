class ContactsController < ApplicationController
  before_action :set_contact, only: %i[ show edit update destroy ]
  after_action :verify_authorized, except: :index

  # GET /contacts or /contacts.json
  def index
  @q = current_user.contacts.order(:last_name).ransack(params[:q])
  @contacts = @q.result
  @contact = Contact.new
  end

  # GET /contacts/1 or /contacts/1.json
  def show
    authorize @contact
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
    authorize @contact
  end

  # GET /contacts/1/edit
  def edit
    authorize @contact    
  end

  # POST /contacts or /contacts.json
  def create
    @contact = Contact.new(contact_params)
    @contact.user_id = current_user.id
    authorize @contact

    respond_to do |format|
      if @contact.save
        format.html { redirect_back fallback_location: root_url, notice: "Contact was successfully created." }
        format.json { render :show, status: :created, location: @contact }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1 or /contacts/1.json
  def update
    authorize @contact
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: "Contact was successfully updated." }
        format.json { render :show, status: :ok, location: @contact }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1 or /contacts/1.json
  def destroy
    authorize @contact
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: "Contact was successfully destroyed." }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(:name, :last_name, :phone_number, :communication_channel, :user_id, :email, :organization, :facebook, :instagram, :twitter)
    end
end
