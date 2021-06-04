class GroupsController < ApplicationController
  before_action :set_group, only: %i[ show edit update destroy ]
  after_action :verify_authorized, except: :index

  # GET /groups or /groups.json
  def index
    @groups = current_user.groups
    @group = Group.new
  end

  # GET /groups/1 or /groups/1.json
  def show
    authorize @group
  end

  # GET /groups/new
  def new
    authorize @group
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
    authorize @group
  end

  # POST /groups or /groups.json
  def create
    @group = current_user.groups.new(group_params)
    authorize @group
    respond_to do |format|
      if @group.save
        format.html { redirect_to groups_path, notice: "Group was successfully created." }
        format.json { render :index, status: :created, location: @group }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
    authorize @group
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    authorize @group
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to groups_path, notice: "Group was successfully updated." }
        format.json { render :show, status: :ok, location: @group }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    authorize @group
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: "Group was successfully destroyed." }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:group_name)
    end
end
