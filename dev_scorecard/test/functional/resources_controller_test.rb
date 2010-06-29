require 'test_helper'

class ResourcesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:resources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create resources" do
    assert_difference('Resources.count') do
      post :create, :resources => { }
    end

    assert_redirected_to resources_path(assigns(:resources))
  end

  test "should show resources" do
    get :show, :id => resources(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => resources(:one).to_param
    assert_response :success
  end

  test "should update resources" do
    put :update, :id => resources(:one).to_param, :resources => { }
    assert_redirected_to resources_path(assigns(:resources))
  end

  test "should destroy resources" do
    assert_difference('Resources.count', -1) do
      delete :destroy, :id => resources(:one).to_param
    end

    assert_redirected_to resources_path
  end
end
