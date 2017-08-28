require 'test_helper'

class ManuIndiExpensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @manu_indi_expense = manu_indi_expenses(:one)
  end

  test "should get index" do
    get manu_indi_expenses_url
    assert_response :success
  end

  test "should get new" do
    get new_manu_indi_expense_url
    assert_response :success
  end

  test "should create manu_indi_expense" do
    assert_difference('ManuIndiExpense.count') do
      post manu_indi_expenses_url, params: { manu_indi_expense: { chart_of_account_id: @manu_indi_expense.chart_of_account_id, program_production: @manu_indi_expense.program_production, totalFixedAndVariable: @manu_indi_expense.totalFixedAndVariable, total_fixed: @manu_indi_expense.total_fixed, total_variable: @manu_indi_expense.total_variable } }
    end

    assert_redirected_to manu_indi_expense_url(ManuIndiExpense.last)
  end

  test "should show manu_indi_expense" do
    get manu_indi_expense_url(@manu_indi_expense)
    assert_response :success
  end

  test "should get edit" do
    get edit_manu_indi_expense_url(@manu_indi_expense)
    assert_response :success
  end

  test "should update manu_indi_expense" do
    patch manu_indi_expense_url(@manu_indi_expense), params: { manu_indi_expense: { chart_of_account_id: @manu_indi_expense.chart_of_account_id, program_production: @manu_indi_expense.program_production, totalFixedAndVariable: @manu_indi_expense.totalFixedAndVariable, total_fixed: @manu_indi_expense.total_fixed, total_variable: @manu_indi_expense.total_variable } }
    assert_redirected_to manu_indi_expense_url(@manu_indi_expense)
  end

  test "should destroy manu_indi_expense" do
    assert_difference('ManuIndiExpense.count', -1) do
      delete manu_indi_expense_url(@manu_indi_expense)
    end

    assert_redirected_to manu_indi_expenses_url
  end
end
