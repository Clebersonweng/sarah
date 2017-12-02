require 'test_helper'

class SupplyDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @supply_detail = supply_details(:one)
  end

  test "should get index" do
    get supply_details_url
    assert_response :success
  end

  test "should get new" do
    get new_supply_detail_url
    assert_response :success
  end

  test "should create supply_detail" do
    assert_difference('SupplyDetail.count') do
      post supply_details_url, params: { supply_detail: { float: @supply_detail.float, product_id: @supply_detail.product_id, quantity_needed: @supply_detail.quantity_needed, subtotal: @supply_detail.subtotal, supply: @supply_detail.supply } }
    end

    assert_redirected_to supply_detail_url(SupplyDetail.last)
  end

  test "should show supply_detail" do
    get supply_detail_url(@supply_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_supply_detail_url(@supply_detail)
    assert_response :success
  end

  test "should update supply_detail" do
    patch supply_detail_url(@supply_detail), params: { supply_detail: { float: @supply_detail.float, product_id: @supply_detail.product_id, quantity_needed: @supply_detail.quantity_needed, subtotal: @supply_detail.subtotal, supply: @supply_detail.supply } }
    assert_redirected_to supply_detail_url(@supply_detail)
  end

  test "should destroy supply_detail" do
    assert_difference('SupplyDetail.count', -1) do
      delete supply_detail_url(@supply_detail)
    end

    assert_redirected_to supply_details_url
  end
end
