require 'test_helper'

class BindersControllerTest < ActionController::TestCase
  setup do
    @binder = binders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:binders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create binder" do
    assert_difference('Binder.count') do
      post :create, binder: { description: @binder.description, title: @binder.title }
    end

    assert_redirected_to binder_path(assigns(:binder))
  end

  test "should show binder" do
    get :show, id: @binder
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @binder
    assert_response :success
  end

  test "should update binder" do
    patch :update, id: @binder, binder: { description: @binder.description, title: @binder.title }
    assert_redirected_to binder_path(assigns(:binder))
  end

  test "should destroy binder" do
    assert_difference('Binder.count', -1) do
      delete :destroy, id: @binder
    end

    assert_redirected_to binders_path
  end
end
