require 'test_helper'

class ConsRawMaterialDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cons_raw_material_detail = cons_raw_material_details(:one)
  end

  test "should get index" do
    get cons_raw_material_details_url
    assert_response :success
  end

  test "should get new" do
    get new_cons_raw_material_detail_url
    assert_response :success
  end

  test "should create cons_raw_material_detail" do
    assert_difference('ConsRawMaterialDetail.count') do
      post cons_raw_material_details_url, params: { cons_raw_material_detail: { cons_raw_material_id: @cons_raw_material_detail.cons_raw_material_id, subtotal: @cons_raw_material_detail.subtotal, supply_id: @cons_raw_material_detail.supply_id, total_unit: @cons_raw_material_detail.total_unit } }
    end

    assert_redirected_to cons_raw_material_detail_url(ConsRawMaterialDetail.last)
  end

  test "should show cons_raw_material_detail" do
    get cons_raw_material_detail_url(@cons_raw_material_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_cons_raw_material_detail_url(@cons_raw_material_detail)
    assert_response :success
  end

  test "should update cons_raw_material_detail" do
    patch cons_raw_material_detail_url(@cons_raw_material_detail), params: { cons_raw_material_detail: { cons_raw_material_id: @cons_raw_material_detail.cons_raw_material_id, subtotal: @cons_raw_material_detail.subtotal, supply_id: @cons_raw_material_detail.supply_id, total_unit: @cons_raw_material_detail.total_unit } }
    assert_redirected_to cons_raw_material_detail_url(@cons_raw_material_detail)
  end

  test "should destroy cons_raw_material_detail" do
    assert_difference('ConsRawMaterialDetail.count', -1) do
      delete cons_raw_material_detail_url(@cons_raw_material_detail)
    end

    assert_redirected_to cons_raw_material_details_url
  end
end
