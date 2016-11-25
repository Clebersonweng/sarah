require 'test_helper'

class CostOperMachinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cost_oper_machine = cost_oper_machines(:one)
  end

  test "should get index" do
    get cost_oper_machines_url
    assert_response :success
  end

  test "should get new" do
    get new_cost_oper_machine_url
    assert_response :success
  end

  test "should create cost_oper_machine" do
    assert_difference('CostOperMachine.count') do
      post cost_oper_machines_url, params: { cost_oper_machine: { farming_plot_id: @cost_oper_machine.farming_plot_id, total: @cost_oper_machine.total } }
    end

    assert_redirected_to cost_oper_machine_url(CostOperMachine.last)
  end

  test "should show cost_oper_machine" do
    get cost_oper_machine_url(@cost_oper_machine)
    assert_response :success
  end

  test "should get edit" do
    get edit_cost_oper_machine_url(@cost_oper_machine)
    assert_response :success
  end

  test "should update cost_oper_machine" do
    patch cost_oper_machine_url(@cost_oper_machine), params: { cost_oper_machine: { farming_plot_id: @cost_oper_machine.farming_plot_id, total: @cost_oper_machine.total } }
    assert_redirected_to cost_oper_machine_url(@cost_oper_machine)
  end

  test "should destroy cost_oper_machine" do
    assert_difference('CostOperMachine.count', -1) do
      delete cost_oper_machine_url(@cost_oper_machine)
    end

    assert_redirected_to cost_oper_machines_url
  end
end
