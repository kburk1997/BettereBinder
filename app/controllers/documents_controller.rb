##
#Controller for the Document class.
class DocumentsController < ApplicationController
  before_action :set_tabs

  before_action :set_document, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:show, :index]

  respond_to :html

  ##
  #Shows all documents in a given binder and tab
  def index
    @documents = Document.all

    respond_with(@documents)
  end

  ##
  #Shows the current binder, with the current tab open, and displaying the document in the iframe.
  def show
    @tabs=@binder.tabs
    @documents=@tab.documents
    for d in @documents
      puts d
    end
    puts @documents
    respond_with(@binder,@tab,@document,@tabs,@documents)
  end

  ##
  #Login required
  #
  #Display a form to create a new document in the given binder and tab.
  def new
    @document = Document.new

    respond_with(@binder,@tab, @document)
  end

  ##
  #Login required
  #
  #Display a form to edit a given document in the given binder and tab.
  def edit
  end

  ##
  #Login required
  #
  #Upon submission of a form, creates a document in the current tab and binder.
  def create
    @document = Document.new(document_params)
    @document.save
    respond_with(@binder,@tab,@document)
  end


  ##
  #Login required
  #
  #Upon submission of a form, updates a given document in the current tab and binder.
  def update
    @document.update(document_params)
    respond_with(@binder,@tab,@document)
  end

  ##
  #Login required
  #
  #After user confirmation, deletes the current document and removes it from the current tab and current binder.
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
