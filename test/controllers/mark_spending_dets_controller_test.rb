require 'test_helper'

class MarkSpendingDetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mark_spending_det = mark_spending_dets(:one)
  end

  test "should get index" do
    get mark_spending_dets_url
    assert_response :success
  end

  test "should get new" do
    get new_mark_spending_det_url
    assert_response :success
  end

  test "should create mark_spending_det" do
    assert_difference('MarkSpendingDet.count') do
      post mark_spending_dets_url, params: { mark_spending_det: { amount: @mark_spending_det.amount, descr: @mark_spending_det.descr, is_fixed: @mark_spending_det.is_fixed, mark_spending_id: @mark_spending_det.mark_spending_id, name: @mark_spending_det.name, subtotal: @mark_spending_det.subtotal } }
    end

    assert_redirected_to mark_spending_det_url(MarkSpendingDet.last)
  end

  test "should show mark_spending_det" do
    get mark_spending_det_url(@mark_spending_det)
    assert_response :success
  end

  test "should get edit" do
    get edit_mark_spending_det_url(@mark_spending_det)
    assert_response :success
  end

  test "should update mark_spending_det" do
    patch mark_spending_det_url(@mark_spending_det), params: { mark_spending_det: { amount: @mark_spending_det.amount, descr: @mark_spending_det.descr, is_fixed: @mark_spending_det.is_fixed, mark_spending_id: @mark_spending_det.mark_spending_id, name: @mark_spending_det.name, subtotal: @mark_spending_det.subtotal } }
    assert_redirected_to mark_spending_det_url(@mark_spending_det)
  end

  test "should destroy mark_spending_det" do
    assert_difference('MarkSpendingDet.count', -1) do
      delete mark_spending_det_url(@mark_spending_det)
    end

    assert_redirected_to mark_spending_dets_url
  end
end
