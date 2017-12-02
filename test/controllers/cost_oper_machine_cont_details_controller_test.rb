require 'test_helper'

class CostOperMachineContDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cost_oper_machine_cont_detail = cost_oper_machine_cont_details(:one)
  end

  test "should get index" do
    get cost_oper_machine_cont_details_url
    assert_response :success
  end

  test "should get new" do
    get new_cost_oper_machine_cont_detail_url
    assert_response :success
  end

  test "should create cost_oper_machine_cont_detail" do
    assert_difference('CostOperMachineContDetail.count') do
      post cost_oper_machine_cont_details_url, params: { cost_oper_machine_cont_detail: { amount: @cost_oper_machine_cont_detail.amount, subtotal: @cost_oper_machine_cont_detail.subtotal, type_of_service_id: @cost_oper_machine_cont_detail.type_of_service_id } }
    end

    assert_redirected_to cost_oper_machine_cont_detail_url(CostOperMachineContDetail.last)
  end

  test "should show cost_oper_machine_cont_detail" do
    get cost_oper_machine_cont_detail_url(@cost_oper_machine_cont_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_cost_oper_machine_cont_detail_url(@cost_oper_machine_cont_detail)
    assert_response :success
  end

  test "should update cost_oper_machine_cont_detail" do
    patch cost_oper_machine_cont_detail_url(@cost_oper_machine_cont_detail), params: { cost_oper_machine_cont_detail: { amount: @cost_oper_machine_cont_detail.amount, subtotal: @cost_oper_machine_cont_detail.subtotal, type_of_service_id: @cost_oper_machine_cont_detail.type_of_service_id } }
    assert_redirected_to cost_oper_machine_cont_detail_url(@cost_oper_machine_cont_detail)
  end

  test "should destroy cost_oper_machine_cont_detail" do
    assert_difference('CostOperMachineContDetail.count', -1) do
      delete cost_oper_machine_cont_detail_url(@cost_oper_machine_cont_detail)
    end

    assert_redirected_to cost_oper_machine_cont_details_url
  end
end
