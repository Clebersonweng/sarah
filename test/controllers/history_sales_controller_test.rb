require 'test_helper'

class HistorySalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @history_sale = history_sales(:one)
  end

  test "should get index" do
    get history_sales_url
    assert_response :success
  end

  test "should get new" do
    get new_history_sale_url
    assert_response :success
  end

  test "should create history_sale" do
    assert_difference('HistorySale.count') do
      post history_sales_url, params: { history_sale: { date: @history_sale.date, period: @history_sale.period, quantity: @history_sale.quantity } }
    end

    assert_redirected_to history_sale_url(HistorySale.last)
  end

  test "should show history_sale" do
    get history_sale_url(@history_sale)
    assert_response :success
  end

  test "should get edit" do
    get edit_history_sale_url(@history_sale)
    assert_response :success
  end

  test "should update history_sale" do
    patch history_sale_url(@history_sale), params: { history_sale: { date: @history_sale.date, period: @history_sale.period, quantity: @history_sale.quantity } }
    assert_redirected_to history_sale_url(@history_sale)
  end

  test "should destroy history_sale" do
    assert_difference('HistorySale.count', -1) do
      delete history_sale_url(@history_sale)
    end

    assert_redirected_to history_sales_url
  end
end
