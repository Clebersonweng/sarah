require 'test_helper'

class ManuIndiExpenseDetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @manu_indi_expense_det = manu_indi_expense_dets(:one)
  end

  test "should get index" do
    get manu_indi_expense_dets_url
    assert_response :success
  end

  test "should get new" do
    get new_manu_indi_expense_det_url
    assert_response :success
  end

  test "should create manu_indi_expense_det" do
    assert_difference('ManuIndiExpenseDet.count') do
      post manu_indi_expense_dets_url, params: { manu_indi_expense_det: { isFixed: @manu_indi_expense_det.isFixed, manu_indi_expense_id: @manu_indi_expense_det.manu_indi_expense_id, name: @manu_indi_expense_det.name, subtotal: @manu_indi_expense_det.subtotal } }
    end

    assert_redirected_to manu_indi_expense_det_url(ManuIndiExpenseDet.last)
  end

  test "should show manu_indi_expense_det" do
    get manu_indi_expense_det_url(@manu_indi_expense_det)
    assert_response :success
  end

  test "should get edit" do
    get edit_manu_indi_expense_det_url(@manu_indi_expense_det)
    assert_response :success
  end

  test "should update manu_indi_expense_det" do
    patch manu_indi_expense_det_url(@manu_indi_expense_det), params: { manu_indi_expense_det: { isFixed: @manu_indi_expense_det.isFixed, manu_indi_expense_id: @manu_indi_expense_det.manu_indi_expense_id, name: @manu_indi_expense_det.name, subtotal: @manu_indi_expense_det.subtotal } }
    assert_redirected_to manu_indi_expense_det_url(@manu_indi_expense_det)
  end

  test "should destroy manu_indi_expense_det" do
    assert_difference('ManuIndiExpenseDet.count', -1) do
      delete manu_indi_expense_det_url(@manu_indi_expense_det)
    end

    assert_redirected_to manu_indi_expense_dets_url
  end
end
