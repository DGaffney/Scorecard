require 'test_helper'

class UserAnswersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_answers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_answer" do
    assert_difference('UserAnswer.count') do
      post :create, :user_answer => { }
    end

    assert_redirected_to user_answer_path(assigns(:user_answer))
  end

  test "should show user_answer" do
    get :show, :id => user_answers(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => user_answers(:one).to_param
    assert_response :success
  end

  test "should update user_answer" do
    put :update, :id => user_answers(:one).to_param, :user_answer => { }
    assert_redirected_to user_answer_path(assigns(:user_answer))
  end

  test "should destroy user_answer" do
    assert_difference('UserAnswer.count', -1) do
      delete :destroy, :id => user_answers(:one).to_param
    end

    assert_redirected_to user_answers_path
  end
end
