require 'test_helper'

class CostOperMachineContsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cost_oper_machine_cont = cost_oper_machine_conts(:one)
  end

  test "should get index" do
    get cost_oper_machine_conts_url
    assert_response :success
  end

  test "should get new" do
    get new_cost_oper_machine_cont_url
    assert_response :success
  end

  test "should create cost_oper_machine_cont" do
    assert_difference('CostOperMachineCont.count') do
      post cost_oper_machine_conts_url, params: { cost_oper_machine_cont: { farming_plot_id_id: @cost_oper_machine_cont.farming_plot_id_id, total: @cost_oper_machine_cont.total } }
    end

    assert_redirected_to cost_oper_machine_cont_url(CostOperMachineCont.last)
  end

  test "should show cost_oper_machine_cont" do
    get cost_oper_machine_cont_url(@cost_oper_machine_cont)
    assert_response :success
  end

  test "should get edit" do
    get edit_cost_oper_machine_cont_url(@cost_oper_machine_cont)
    assert_response :success
  end

  test "should update cost_oper_machine_cont" do
    patch cost_oper_machine_cont_url(@cost_oper_machine_cont), params: { cost_oper_machine_cont: { farming_plot_id_id: @cost_oper_machine_cont.farming_plot_id_id, total: @cost_oper_machine_cont.total } }
    assert_redirected_to cost_oper_machine_cont_url(@cost_oper_machine_cont)
  end

  test "should destroy cost_oper_machine_cont" do
    assert_difference('CostOperMachineCont.count', -1) do
      delete cost_oper_machine_cont_url(@cost_oper_machine_cont)
    end

    assert_redirected_to cost_oper_machine_conts_url
  end
end
