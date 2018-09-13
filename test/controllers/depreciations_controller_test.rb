require 'test_helper'

class DepreciationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @depreciation = depreciations(:one)
  end

  test "should get index" do
    get depreciations_url
    assert_response :success
  end

  test "should get new" do
    get new_depreciation_url
    assert_response :success
  end

  test "should create depreciation" do
    assert_difference('Depreciation.count') do
      post depreciations_url, params: { depreciation: { cost_oper_machine_id: @depreciation.cost_oper_machine_id, program_production_id: @depreciation.program_production_id, total: @depreciation.total } }
    end

    assert_redirected_to depreciation_url(Depreciation.last)
  end

  test "should show depreciation" do
    get depreciation_url(@depreciation)
    assert_response :success
  end

  test "should get edit" do
    get edit_depreciation_url(@depreciation)
    assert_response :success
  end

  test "should update depreciation" do
    patch depreciation_url(@depreciation), params: { depreciation: { cost_oper_machine_id: @depreciation.cost_oper_machine_id, program_production_id: @depreciation.program_production_id, total: @depreciation.total } }
    assert_redirected_to depreciation_url(@depreciation)
  end

  test "should destroy depreciation" do
    assert_difference('Depreciation.count', -1) do
      delete depreciation_url(@depreciation)
    end

    assert_redirected_to depreciations_url
  end
end
