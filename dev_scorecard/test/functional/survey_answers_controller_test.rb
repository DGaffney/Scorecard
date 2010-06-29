require 'test_helper'

class SurveyAnswersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:survey_answers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create survey_answer" do
    assert_difference('SurveyAnswer.count') do
      post :create, :survey_answer => { }
    end

    assert_redirected_to survey_answer_path(assigns(:survey_answer))
  end

  test "should show survey_answer" do
    get :show, :id => survey_answers(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => survey_answers(:one).to_param
    assert_response :success
  end

  test "should update survey_answer" do
    put :update, :id => survey_answers(:one).to_param, :survey_answer => { }
    assert_redirected_to survey_answer_path(assigns(:survey_answer))
  end

  test "should destroy survey_answer" do
    assert_difference('SurveyAnswer.count', -1) do
      delete :destroy, :id => survey_answers(:one).to_param
    end

    assert_redirected_to survey_answers_path
  end
end
