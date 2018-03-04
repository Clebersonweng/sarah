require 'test_helper'

class ManPowerDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @man_power_detail = man_power_details(:one)
  end

  test "should get index" do
    get man_power_details_url
    assert_response :success
  end

  test "should get new" do
    get new_man_power_detail_url
    assert_response :success
  end

  test "should create man_power_detail" do
    assert_difference('ManPowerDetail.count') do
      post man_power_details_url, params: { man_power_detail: { hours_needed: @man_power_detail.hours_needed, hours_needed: @man_power_detail.hours_needed, man_power_id: @man_power_detail.man_power_id, person_id: @man_power_detail.person_id, subtotal: @man_power_detail.subtotal, subtotal: @man_power_detail.subtotal, type_of_work_id: @man_power_detail.type_of_work_id } }
    end

    assert_redirected_to man_power_detail_url(ManPowerDetail.last)
  end

  test "should show man_power_detail" do
    get man_power_detail_url(@man_power_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_man_power_detail_url(@man_power_detail)
    assert_response :success
  end

  test "should update man_power_detail" do
    patch man_power_detail_url(@man_power_detail), params: { man_power_detail: { hours_needed: @man_power_detail.hours_needed, hours_needed: @man_power_detail.hours_needed, man_power_id: @man_power_detail.man_power_id, person_id: @man_power_detail.person_id, subtotal: @man_power_detail.subtotal, subtotal: @man_power_detail.subtotal, type_of_work_id: @man_power_detail.type_of_work_id } }
    assert_redirected_to man_power_detail_url(@man_power_detail)
  end

  test "should destroy man_power_detail" do
    assert_difference('ManPowerDetail.count', -1) do
      delete man_power_detail_url(@man_power_detail)
    end

    assert_redirected_to man_power_details_url
  end
end
