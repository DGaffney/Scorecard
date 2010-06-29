require 'test_helper'

class CasesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cases" do
    assert_difference('Cases.count') do
      post :create, :cases => { }
    end

    assert_redirected_to cases_path(assigns(:cases))
  end

  test "should show cases" do
    get :show, :id => cases(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => cases(:one).to_param
    assert_response :success
  end

  test "should update cases" do
    put :update, :id => cases(:one).to_param, :cases => { }
    assert_redirected_to cases_path(assigns(:cases))
  end

  test "should destroy cases" do
    assert_difference('Cases.count', -1) do
      delete :destroy, :id => cases(:one).to_param
    end

    assert_redirected_to cases_path
  end
end
