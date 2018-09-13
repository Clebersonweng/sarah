require 'test_helper'

class DepreciationDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @depreciation_detail = depreciation_details(:one)
  end

  test "should get index" do
    get depreciation_details_url
    assert_response :success
  end

  test "should get new" do
    get new_depreciation_detail_url
    assert_response :success
  end

  test "should create depreciation_detail" do
    assert_difference('DepreciationDetail.count') do
      post depreciation_details_url, params: { depreciation_detail: { annual_depre: @depreciation_detail.annual_depre, cost_oper_machine_id: @depreciation_detail.cost_oper_machine_id, depreciation_id: @depreciation_detail.depreciation_id, hours_used: @depreciation_detail.hours_used, net_value_prev_year: @depreciation_detail.net_value_prev_year, per_day_depre: @depreciation_detail.per_day_depre, per_hour_depre: @depreciation_detail.per_hour_depre, revaluation_coefficient_id: @depreciation_detail.revaluation_coefficient_id, revalued_value: @depreciation_detail.revalued_value, subtotal: @depreciation_detail.subtotal, year_use_life: @depreciation_detail.year_use_life, year_use_life_remain: @depreciation_detail.year_use_life_remain } }
    end

    assert_redirected_to depreciation_detail_url(DepreciationDetail.last)
  end

  test "should show depreciation_detail" do
    get depreciation_detail_url(@depreciation_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_depreciation_detail_url(@depreciation_detail)
    assert_response :success
  end

  test "should update depreciation_detail" do
    patch depreciation_detail_url(@depreciation_detail), params: { depreciation_detail: { annual_depre: @depreciation_detail.annual_depre, cost_oper_machine_id: @depreciation_detail.cost_oper_machine_id, depreciation_id: @depreciation_detail.depreciation_id, hours_used: @depreciation_detail.hours_used, net_value_prev_year: @depreciation_detail.net_value_prev_year, per_day_depre: @depreciation_detail.per_day_depre, per_hour_depre: @depreciation_detail.per_hour_depre, revaluation_coefficient_id: @depreciation_detail.revaluation_coefficient_id, revalued_value: @depreciation_detail.revalued_value, subtotal: @depreciation_detail.subtotal, year_use_life: @depreciation_detail.year_use_life, year_use_life_remain: @depreciation_detail.year_use_life_remain } }
    assert_redirected_to depreciation_detail_url(@depreciation_detail)
  end

  test "should destroy depreciation_detail" do
    assert_difference('DepreciationDetail.count', -1) do
      delete depreciation_detail_url(@depreciation_detail)
    end

    assert_redirected_to depreciation_details_url
  end
end
