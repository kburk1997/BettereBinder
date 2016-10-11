class TabsController < ApplicationController
  before_action :set_tab, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @tabs = Tab.all
    @binder=Binder.find(params[:binder_id])
    respond_with(@tabs)
  end

  def show
    @binder=Binder.find(params[:binder_id])

    respond_with(@binder, @tab)
  end

  def new
    @binder=Binder.find(params[:binder_id])

    @tab = Tab.new
    respond_with(@binder, @tab)
  end

  def edit
    @binder=Binder.find(params[:binder_id])

  end

  def create
    @binder=Binder.find(params[:binder_id])

    @tab = @binder.tabs.create(tab_params)
    @tab.save
    respond_with(@binder, @tab)
  end

  def update
    @binder=Binder.find(params[:binder_id])

    @tab.update(tab_params)
    respond_with(@binder, @tab)
  end

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
