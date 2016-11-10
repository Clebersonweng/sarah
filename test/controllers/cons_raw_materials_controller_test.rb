require 'test_helper'

class ConsRawMaterialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cons_raw_material = cons_raw_materials(:one)
  end

  test "should get index" do
    get cons_raw_materials_url
    assert_response :success
  end

  test "should get new" do
    get new_cons_raw_material_url
    assert_response :success
  end

  test "should create cons_raw_material" do
    assert_difference('ConsRawMaterial.count') do
      post cons_raw_materials_url, params: { cons_raw_material: { program_production_id: @cons_raw_material.program_production_id, total: @cons_raw_material.total } }
    end

    assert_redirected_to cons_raw_material_url(ConsRawMaterial.last)
  end

  test "should show cons_raw_material" do
    get cons_raw_material_url(@cons_raw_material)
    assert_response :success
  end

  test "should get edit" do
    get edit_cons_raw_material_url(@cons_raw_material)
    assert_response :success
  end

  test "should update cons_raw_material" do
    patch cons_raw_material_url(@cons_raw_material), params: { cons_raw_material: { program_production_id: @cons_raw_material.program_production_id, total: @cons_raw_material.total } }
    assert_redirected_to cons_raw_material_url(@cons_raw_material)
  end

  test "should destroy cons_raw_material" do
    assert_difference('ConsRawMaterial.count', -1) do
      delete cons_raw_material_url(@cons_raw_material)
    end

    assert_redirected_to cons_raw_materials_url
  end
end
