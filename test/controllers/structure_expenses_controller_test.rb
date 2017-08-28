require 'test_helper'

class StructureExpensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @structure_expense = structure_expenses(:one)
  end

  test "should get index" do
    get structure_expenses_url
    assert_response :success
  end

  test "should get new" do
    get new_structure_expense_url
    assert_response :success
  end

  test "should create structure_expense" do
    assert_difference('StructureExpense.count') do
      post structure_expenses_url, params: { structure_expense: { chart_of_account_id: @structure_expense.chart_of_account_id, program_production_id: @structure_expense.program_production_id, total: @structure_expense.total } }
    end

    assert_redirected_to structure_expense_url(StructureExpense.last)
  end

  test "should show structure_expense" do
    get structure_expense_url(@structure_expense)
    assert_response :success
  end

  test "should get edit" do
    get edit_structure_expense_url(@structure_expense)
    assert_response :success
  end

  test "should update structure_expense" do
    patch structure_expense_url(@structure_expense), params: { structure_expense: { chart_of_account_id: @structure_expense.chart_of_account_id, program_production_id: @structure_expense.program_production_id, total: @structure_expense.total } }
    assert_redirected_to structure_expense_url(@structure_expense)
  end

  test "should destroy structure_expense" do
    assert_difference('StructureExpense.count', -1) do
      delete structure_expense_url(@structure_expense)
    end

    assert_redirected_to structure_expenses_url
  end
end
