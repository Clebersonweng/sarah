require 'test_helper'

class EstimateSalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @estimate_sale = estimate_sales(:one)
  end

  test "should get index" do
    get estimate_sales_url
    assert_response :success
  end

  test "should get new" do
    get new_estimate_sale_url
    assert_response :success
  end

  test "should create estimate_sale" do
    assert_difference('EstimateSale.count') do
      post estimate_sales_url, params: { estimate_sale: { estimate_production: @estimate_sale.estimate_production, farming_plot_id: @estimate_sale.farming_plot_id, gross_sale: @estimate_sale.gross_sale, price: @estimate_sale.price, total_production: @estimate_sale.total_production } }
    end

    assert_redirected_to estimate_sale_url(EstimateSale.last)
  end

  test "should show estimate_sale" do
    get estimate_sale_url(@estimate_sale)
    assert_response :success
  end

  test "should get edit" do
    get edit_estimate_sale_url(@estimate_sale)
    assert_response :success
  end

  test "should update estimate_sale" do
    patch estimate_sale_url(@estimate_sale), params: { estimate_sale: { estimate_production: @estimate_sale.estimate_production, farming_plot_id: @estimate_sale.farming_plot_id, gross_sale: @estimate_sale.gross_sale, price: @estimate_sale.price, total_production: @estimate_sale.total_production } }
    assert_redirected_to estimate_sale_url(@estimate_sale)
  end

  test "should destroy estimate_sale" do
    assert_difference('EstimateSale.count', -1) do
      delete estimate_sale_url(@estimate_sale)
    end

    assert_redirected_to estimate_sales_url
  end
end
