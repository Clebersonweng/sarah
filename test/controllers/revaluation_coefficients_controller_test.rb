require 'test_helper'

class RevaluationCoefficientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @revaluation_coefficient = revaluation_coefficients(:one)
  end

  test "should get index" do
    get revaluation_coefficients_url
    assert_response :success
  end

  test "should get new" do
    get new_revaluation_coefficient_url
    assert_response :success
  end

  test "should create revaluation_coefficient" do
    assert_difference('RevaluationCoefficient.count') do
      post revaluation_coefficients_url, params: { revaluation_coefficient: { coefficient: @revaluation_coefficient.coefficient, end_period: @revaluation_coefficient.end_period, start_period: @revaluation_coefficient.start_period } }
    end

    assert_redirected_to revaluation_coefficient_url(RevaluationCoefficient.last)
  end

  test "should show revaluation_coefficient" do
    get revaluation_coefficient_url(@revaluation_coefficient)
    assert_response :success
  end

  test "should get edit" do
    get edit_revaluation_coefficient_url(@revaluation_coefficient)
    assert_response :success
  end

  test "should update revaluation_coefficient" do
    patch revaluation_coefficient_url(@revaluation_coefficient), params: { revaluation_coefficient: { coefficient: @revaluation_coefficient.coefficient, end_period: @revaluation_coefficient.end_period, start_period: @revaluation_coefficient.start_period } }
    assert_redirected_to revaluation_coefficient_url(@revaluation_coefficient)
  end

  test "should destroy revaluation_coefficient" do
    assert_difference('RevaluationCoefficient.count', -1) do
      delete revaluation_coefficient_url(@revaluation_coefficient)
    end

    assert_redirected_to revaluation_coefficients_url
  end
end
