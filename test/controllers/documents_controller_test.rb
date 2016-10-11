require 'test_helper'

class DocumentsControllerTest < ActionController::TestCase
  setup do
    @binder=binders(:one)
    @tab = tabs(:one)
    @document = documents(:one)
  end

  test "should get index" do
    get :index, :binder_id=> @binder.id, :tab_id=> @tab.id
    assert_response :success
    assert_not_nil assigns(:documents)
  end

  test "should get new" do
    get :new, :binder_id=> @binder.id, :tab_id=> @tab.id
    assert_response :success
  end

  test "should create document" do
    assert_difference('Document.count') do
      post :create, :binder_id=> @binder.id, :tab_id=> @tab.id, document: { description: @document.description, document_url: @document.document_url, tab_id: @document.tab_id, title: @document.title }
    end

    assert_redirected_to binder_tab_document_path(@binder,@tab,assigns(:document))
  end

  test "should show document" do
    get :show, :binder_id=> @binder.id, :tab_id=> @tab.id, id: @document
    assert_response :success
  end

  test "should get edit" do
    get :edit, :binder_id=> @binder.id, :tab_id=> @tab.id, id: @document
    assert_response :success
  end

  test "should update document" do
    patch :update, :binder_id=> @binder.id, :tab_id=> @tab.id, id: @document, document: { description: @document.description, document_url: @document.document_url, tab_id: @document.tab_id, title: @document.title }
    assert_redirected_to binder_tab_document_path(@binder,@tab,assigns(:document))
  end

  test "should destroy document" do
    assert_difference('Document.count', -1) do
      delete :destroy, :binder_id=> @binder.id, :tab_id=> @tab.id, id: @document
    end

    assert_redirected_to binder_tab_documents_path(@binder,@tab)
  end
end
