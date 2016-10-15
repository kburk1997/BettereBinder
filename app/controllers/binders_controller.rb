##
#Controller for the Binder class.
class BindersController < ApplicationController
  before_action :set_binder, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:show, :index]

  ##
  # When called, shows the homepage for all binders.
  #
  # Routes:
  # * GET /binders - standard HTML page
  # * GET /binders.json - JSON data for binders
  def index
    @binders = Binder.all
  end

  ##
  #Login required
  #
  #When called, shows all the current user's binders.
  #
  #Route: /my_binders/
  def user
    @binders=current_user.binders
    @user=current_user
  end

  ##
  #Shows the homepage for a given binder.
  #In the following example, the binder id is 1.
  #
  # Routes:
  # * GET /binders/1 - Shows the homepage for the binder with id 1.
  # * GET /binders/1.json - Shows JSON data for binder id 1.
  def show
    @tabs=@binder.tabs
  end
  
  ##
  #Login required
  #Creates a new binder.
  #Route:
  # GET /binders/new
  def new
    @binder = Binder.new
  end

  # GET /binders/1/edit
  def edit
  end

  # POST /binders
  # POST /binders.json
  def create
    @binder = Binder.new(binder_params)

    respond_to do |format|
      if @binder.save
        format.html { redirect_to @binder, notice: 'Binder was successfully created.' }
        format.json { render action: 'show', status: :created, location: @binder }
      else
        format.html { render action: 'new' }
        format.json { render json: @binder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /binders/1
  # PATCH/PUT /binders/1.json
  def update
    respond_to do |format|
      if @binder.update(binder_params)
        format.html { redirect_to @binder, notice: 'Binder was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @binder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /binders/1
  # DELETE /binders/1.json
  def destroy
    @binder.destroy
    respond_to do |format|
      format.html { redirect_to binders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_binder
      @binder = Binder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def binder_params
      params.require(:binder).permit(:title, :description)
    end
end
