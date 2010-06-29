require 'test_helper'

class CaseAnswersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:case_answers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create case_answers" do
    assert_difference('CaseAnswers.count') do
      post :create, :case_answers => { }
    end

    assert_redirected_to case_answers_path(assigns(:case_answers))
  end

  test "should show case_answers" do
    get :show, :id => case_answers(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => case_answers(:one).to_param
    assert_response :success
  end

  test "should update case_answers" do
    put :update, :id => case_answers(:one).to_param, :case_answers => { }
    assert_redirected_to case_answers_path(assigns(:case_answers))
  end

  test "should destroy case_answers" do
    assert_difference('CaseAnswers.count', -1) do
      delete :destroy, :id => case_answers(:one).to_param
    end

    assert_redirected_to case_answers_path
  end
end
