require 'test_helper'

class OrderfilesControllerTest < ActionController::TestCase
  setup do
    @orderfile = orderfiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orderfiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create orderfile" do
    assert_difference('Orderfile.count') do
      post :create, orderfile: {  }
    end

    assert_redirected_to orderfile_path(assigns(:orderfile))
  end

  test "should show orderfile" do
    get :show, id: @orderfile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @orderfile
    assert_response :success
  end

  test "should update orderfile" do
    patch :update, id: @orderfile, orderfile: {  }
    assert_redirected_to orderfile_path(assigns(:orderfile))
  end

  test "should destroy orderfile" do
    assert_difference('Orderfile.count', -1) do
      delete :destroy, id: @orderfile
    end

    assert_redirected_to orderfiles_path
  end
end
