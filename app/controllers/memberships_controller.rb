class MembershipsController < ApplicationController
  before_action :set_membership, only: %i[ show edit update destroy ]
  after_action :verify_authorized, except: :index

  # GET /memberships or /memberships.json s
  def index
    @memberships = Membership.all
  end

  # GET /memberships/1 or /memberships/1.json
  def show
  end

  # GET /memberships/new
  def new
    @group = Group.find(params.fetch("group_id"))
    @membership = Membership.new
    @groups = current_user.groups
    @contacts = current_user.contacts.order(:last_name)
    authorize @membership

    respond_to do |format|
      format.html
      format.js
    end
      
  end

  # GET /memberships/1/edit
  def edit
    @groups = Group.all.where(user_id: current_user)
    @contacts = Contact.all.where(user_id: current_user).order(:last_name)    
  end

  # POST /memberships or /memberships.json
  def create
    @membership = Membership.new(membership_params)
    @group = @membership.group

    respond_to do |format|
      if @membership.save
        format.html { redirect_back fallback_location: root_url, notice: "Membership was successfully created." }
        format.json { render :show, status: :created, location: @membership }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
        format.js
      end
    end
    authorize @membership
  end

  # PATCH/PUT /memberships/1 or /memberships/1.json
  def update
    respond_to do |format|
      if @membership.update(membership_params)
        format.html { redirect_back fallback_location: root_url, notice: "Membership was successfully updated." }
        format.json { render :show, status: :ok, location: @membership }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memberships/1 or /memberships/1.json
  def destroy
    authorize @membership
    @membership.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_url, notice: "Membership was successfully destroyed." }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_membership
      @membership = Membership.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def membership_params
      params.require(:membership).permit(:group_id, :contact_id)
    end
end
