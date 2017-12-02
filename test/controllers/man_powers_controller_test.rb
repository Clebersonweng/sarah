require 'test_helper'

class ManPowersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @man_power = man_powers(:one)
  end

  test "should get index" do
    get man_powers_url
    assert_response :success
  end

  test "should get new" do
    get new_man_power_url
    assert_response :success
  end

  test "should create man_power" do
    assert_difference('ManPower.count') do
      post man_powers_url, params: { man_power: { program_production_id: @man_power.program_production_id, total: @man_power.total, total_hours_needed: @man_power.total_hours_needed } }
    end

    assert_redirected_to man_power_url(ManPower.last)
  end

  test "should show man_power" do
    get man_power_url(@man_power)
    assert_response :success
  end

  test "should get edit" do
    get edit_man_power_url(@man_power)
    assert_response :success
  end

  test "should update man_power" do
    patch man_power_url(@man_power), params: { man_power: { program_production_id: @man_power.program_production_id, total: @man_power.total, total_hours_needed: @man_power.total_hours_needed } }
    assert_redirected_to man_power_url(@man_power)
  end

  test "should destroy man_power" do
    assert_difference('ManPower.count', -1) do
      delete man_power_url(@man_power)
    end

    assert_redirected_to man_powers_url
  end
end
