require 'test_helper'

class AvaliationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @avaliation = avaliations(:one)
  end

  test "should get index" do
    get avaliations_url
    assert_response :success
  end

  test "should get new" do
    get new_avaliation_url
    assert_response :success
  end

  test "should create avaliation" do
    assert_difference('Avaliation.count') do
      post avaliations_url, params: { avaliation: { model: @avaliation.model, teacher_id: @avaliation.teacher_id } }
    end

    assert_redirected_to avaliation_url(Avaliation.last)
  end

  test "should show avaliation" do
    get avaliation_url(@avaliation)
    assert_response :success
  end

  test "should get edit" do
    get edit_avaliation_url(@avaliation)
    assert_response :success
  end

  test "should update avaliation" do
    patch avaliation_url(@avaliation), params: { avaliation: { model: @avaliation.model, teacher_id: @avaliation.teacher_id } }
    assert_redirected_to avaliation_url(@avaliation)
  end

  test "should destroy avaliation" do
    assert_difference('Avaliation.count', -1) do
      delete avaliation_url(@avaliation)
    end

    assert_redirected_to avaliations_url
  end
end
