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
    get :new
    assert_response :success
  end

  test "should create tab" do
    assert_difference('Tab.count') do
      post :create, tab: { description: @tab.description, title: @tab.title }, binder_id: @binder
    end

    assert_redirected_to tab_path(assigns(:tab))
  end

  test "should show tab" do
    get :show, id: @tab
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tab
    assert_response :success
  end

  test "should update tab" do
    patch :update, id: @tab, tab: { description: @tab.description, title: @tab.title }
    assert_redirected_to tab_path(assigns(:tab))
  end

  test "should destroy tab" do
    assert_difference('Tab.count', -1) do
      delete :destroy, id: @tab
    end

    assert_redirected_to tabs_path
  end
end
