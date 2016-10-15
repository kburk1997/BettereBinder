##
#Controller for the Document class.
class DocumentsController < ApplicationController
  before_action :set_tabs

  before_action :set_document, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:show, :index]

  respond_to :html

  def index
    @documents = Document.all

    respond_with(@documents)
  end

  def show
    @tabs=@binder.tabs
    @documents=@tab.documents
    for d in @documents
      puts d
    end
    puts @documents
    respond_with(@binder,@tab,@document,@tabs,@documents)
  end

  def new
    @document = Document.new

    respond_with(@binder,@tab, @document)
  end

  def edit
  end

  def create
    @document = Document.new(document_params)
    @document.save
    respond_with(@binder,@tab,@document)
  end

  def update
    @document.update(document_params)
    respond_with(@binder,@tab,@document)
  end

  def destroy
    @document.destroy
    respond_with(@binder,@tab,@document)
  end

  private
    def set_document
      @document = Document.find(params[:id])
    end

    def set_tabs
      @tab=Tab.find(params[:tab_id])
      @binder=Binder.find(params[:binder_id])
    end

    def document_params
      params.require(:document).permit(:title, :description, :document_url, :tab_id)
    end
end
