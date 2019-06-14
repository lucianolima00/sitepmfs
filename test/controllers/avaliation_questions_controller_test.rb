require 'test_helper'

class AvaliationQuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @avaliation_question = avaliation_questions(:one)
  end

  test "should get index" do
    get avaliation_questions_url
    assert_response :success
  end

  test "should get new" do
    get new_avaliation_question_url
    assert_response :success
  end

  test "should create avaliation_question" do
    assert_difference('AvaliationQuestion.count') do
      post avaliation_questions_url, params: { avaliation_question: { Statement: @avaliation_question.Statement, altA: @avaliation_question.altA, altB: @avaliation_question.altB, altC: @avaliation_question.altC, altD: @avaliation_question.altD, altE: @avaliation_question.altE, avaliation_id: @avaliation_question.avaliation_id } }
    end

    assert_redirected_to avaliation_question_url(AvaliationQuestion.last)
  end

  test "should show avaliation_question" do
    get avaliation_question_url(@avaliation_question)
    assert_response :success
  end

  test "should get edit" do
    get edit_avaliation_question_url(@avaliation_question)
    assert_response :success
  end

  test "should update avaliation_question" do
    patch avaliation_question_url(@avaliation_question), params: { avaliation_question: { Statement: @avaliation_question.Statement, altA: @avaliation_question.altA, altB: @avaliation_question.altB, altC: @avaliation_question.altC, altD: @avaliation_question.altD, altE: @avaliation_question.altE, avaliation_id: @avaliation_question.avaliation_id } }
    assert_redirected_to avaliation_question_url(@avaliation_question)
  end

  test "should destroy avaliation_question" do
    assert_difference('AvaliationQuestion.count', -1) do
      delete avaliation_question_url(@avaliation_question)
    end

    assert_redirected_to avaliation_questions_url
  end
end
