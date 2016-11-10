require 'test_helper'

class ProgramProductionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @program_production = program_productions(:one)
  end

  test "should get index" do
    get program_productions_url
    assert_response :success
  end

  test "should get new" do
    get new_program_production_url
    assert_response :success
  end

  test "should create program_production" do
    assert_difference('ProgramProduction.count') do
      post program_productions_url, params: { program_production: { estimate_sale_id: @program_production.estimate_sale_id, program_production: @program_production.program_production, stock_end: @program_production.stock_end, stock_initial: @program_production.stock_initial, variation_stock: @program_production.variation_stock } }
    end

    assert_redirected_to program_production_url(ProgramProduction.last)
  end

  test "should show program_production" do
    get program_production_url(@program_production)
    assert_response :success
  end

  test "should get edit" do
    get edit_program_production_url(@program_production)
    assert_response :success
  end

  test "should update program_production" do
    patch program_production_url(@program_production), params: { program_production: { estimate_sale_id: @program_production.estimate_sale_id, program_production: @program_production.program_production, stock_end: @program_production.stock_end, stock_initial: @program_production.stock_initial, variation_stock: @program_production.variation_stock } }
    assert_redirected_to program_production_url(@program_production)
  end

  test "should destroy program_production" do
    assert_difference('ProgramProduction.count', -1) do
      delete program_production_url(@program_production)
    end

    assert_redirected_to program_productions_url
  end
end
