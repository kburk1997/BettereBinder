##
#Controller for the Tab class.
class TabsController < ApplicationController
  before_action :set_tab, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:show, :index]

  respond_to :html
  ##
  #Shows all tabs in a binder.
  def index
    @tabs = Tab.all
    @binder=Binder.find(params[:binder_id])
    respond_with(@tabs)
  end
  ##
  #
  #Shows a binder with :binder_id with the current tab open.
  def show
    @binder=Binder.find(params[:binder_id])
    @tabs=@binder.tabs
    @documents=@tab.documents
    respond_with(@binder, @tab)
  end
  ##
  #Login required
  #
  #Renders a form to create a tab in the current binder.
  def new
    @binder=Binder.find(params[:binder_id])

    @tab = Tab.new
    respond_with(@binder, @tab)
  end
  ##
  #Login required
  #
  #Renders a form to edit the current tab.
  def edit
    @binder=Binder.find(params[:binder_id])

  end
  ##
  #Login required
  #
  #Upon submission of a form, creates a tab in the current binder.
  def create
    @binder=Binder.find(params[:binder_id])

    @tab = @binder.tabs.create(tab_params)
    @tab.save
    respond_with(@binder, @tab)
  end
  ##
  #Login required
  #
  #Upon submission of a form, updates the current tab.
  def update
    @binder=Binder.find(params[:binder_id])

    @tab.update(tab_params)
    respond_with(@binder, @tab)
  end
  ##
  #Login required
  #
  #Deletes the current tab and removes it from the binder.
  def destroy
    @binder=Binder.find(params[:binder_id])

    @tab.destroy
    respond_with(@binder, @tab)
  end

  private
    def set_tab
      @tab = Tab.find(params[:id])
    end

    def tab_params
      params.require(:tab).permit(:title, :description)
    end
end
