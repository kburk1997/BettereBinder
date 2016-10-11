require 'test_helper'

class TabsControllerTest < ActionController::TestCase
  setup do
    @binder=binders(:one)
    @tab = tabs(:one)
  end

  test "should get index" do
    get :index, :binder_id=> @binder.id
    assert_response :success
    assert_not_nil assigns(:tabs)
  end

  test "should get new" do
    get :new, :binder_id=> @binder.id
    assert_response :success
  end

  test "should create tab" do
    assert_difference('Tab.count') do
      post :create, tab: { description: @tab.description, title: @tab.title }, binder_id: @binder
    end

    assert_redirected_to binder_tab_path(@binder, assigns(:tab))
  end

  test "should show tab" do
    get :show, :binder_id=> @binder.id, id: @tab
    assert_response :success
  end

  test "should get edit" do
    get :edit, :binder_id=> @binder.id, id: @tab
    assert_response :success
  end

  test "should update tab" do
    patch :update, :binder_id=> @binder.id, id: @tab, tab: { description: @tab.description, title: @tab.title }
    assert_redirected_to binder_tab_path(@binder, assigns(:tab))
  end

  test "should destroy tab" do
    assert_difference('Tab.count', -1) do
      delete :destroy, :binder_id=> @binder.id, id: @tab
    end

    assert_redirected_to binder_tabs_path(@binder)
  end
end
