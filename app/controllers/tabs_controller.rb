class TabsController < ApplicationController
  before_action :set_tab, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @tabs = Tab.all
    respond_with(@tabs)
  end

  def show
    respond_with(@tab)
  end

  def new
    @tab = Tab.new
    respond_with(@tab)
  end

  def edit
  end

  def create
    @tab = Tab.new(tab_params)
    @tab.save
    respond_with(@tab)
  end

  def update
    @tab.update(tab_params)
    respond_with(@tab)
  end

  def destroy
    @tab.destroy
    respond_with(@tab)
  end

  private
    def set_tab
      @tab = Tab.find(params[:id])
    end

    def tab_params
      params.require(:tab).permit(:title, :description)
    end
end
