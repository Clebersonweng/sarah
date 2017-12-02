require 'test_helper'

class CostOperMachineDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cost_oper_machine_detail = cost_oper_machine_details(:one)
  end

  test "should get index" do
    get cost_oper_machine_details_url
    assert_response :success
  end

  test "should get new" do
    get new_cost_oper_machine_detail_url
    assert_response :success
  end

  test "should create cost_oper_machine_detail" do
    assert_difference('CostOperMachineDetail.count') do
      post cost_oper_machine_details_url, params: { cost_oper_machine_detail: { amount: @cost_oper_machine_detail.amount, cost_oper_machine_id: @cost_oper_machine_detail.cost_oper_machine_id, fuel: @cost_oper_machine_detail.fuel, lubricant: @cost_oper_machine_detail.lubricant, machine_id: @cost_oper_machine_detail.machine_id, repair_and_maintenance: @cost_oper_machine_detail.repair_and_maintenance, subtotal: @cost_oper_machine_detail.subtotal } }
    end

    assert_redirected_to cost_oper_machine_detail_url(CostOperMachineDetail.last)
  end

  test "should show cost_oper_machine_detail" do
    get cost_oper_machine_detail_url(@cost_oper_machine_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_cost_oper_machine_detail_url(@cost_oper_machine_detail)
    assert_response :success
  end

  test "should update cost_oper_machine_detail" do
    patch cost_oper_machine_detail_url(@cost_oper_machine_detail), params: { cost_oper_machine_detail: { amount: @cost_oper_machine_detail.amount, cost_oper_machine_id: @cost_oper_machine_detail.cost_oper_machine_id, fuel: @cost_oper_machine_detail.fuel, lubricant: @cost_oper_machine_detail.lubricant, machine_id: @cost_oper_machine_detail.machine_id, repair_and_maintenance: @cost_oper_machine_detail.repair_and_maintenance, subtotal: @cost_oper_machine_detail.subtotal } }
    assert_redirected_to cost_oper_machine_detail_url(@cost_oper_machine_detail)
  end

  test "should destroy cost_oper_machine_detail" do
    assert_difference('CostOperMachineDetail.count', -1) do
      delete cost_oper_machine_detail_url(@cost_oper_machine_detail)
    end

    assert_redirected_to cost_oper_machine_details_url
  end
end
