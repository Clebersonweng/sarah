require 'test_helper'

class MarkSpendingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mark_spending = mark_spendings(:one)
  end

  test "should get index" do
    get mark_spendings_url
    assert_response :success
  end

  test "should get new" do
    get new_mark_spending_url
    assert_response :success
  end

  test "should create mark_spending" do
    assert_difference('MarkSpending.count') do
      post mark_spendings_url, params: { mark_spending: { chart_of_account_id: @mark_spending.chart_of_account_id, estimate_sale_id: @mark_spending.estimate_sale_id, total: @mark_spending.total } }
    end

    assert_redirected_to mark_spending_url(MarkSpending.last)
  end

  test "should show mark_spending" do
    get mark_spending_url(@mark_spending)
    assert_response :success
  end

  test "should get edit" do
    get edit_mark_spending_url(@mark_spending)
    assert_response :success
  end

  test "should update mark_spending" do
    patch mark_spending_url(@mark_spending), params: { mark_spending: { chart_of_account_id: @mark_spending.chart_of_account_id, estimate_sale_id: @mark_spending.estimate_sale_id, total: @mark_spending.total } }
    assert_redirected_to mark_spending_url(@mark_spending)
  end

  test "should destroy mark_spending" do
    assert_difference('MarkSpending.count', -1) do
      delete mark_spending_url(@mark_spending)
    end

    assert_redirected_to mark_spendings_url
  end
end
