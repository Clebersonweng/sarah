require 'test_helper'

class StruExpenseDetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stru_expense_det = stru_expense_dets(:one)
  end

  test "should get index" do
    get stru_expense_dets_url
    assert_response :success
  end

  test "should get new" do
    get new_stru_expense_det_url
    assert_response :success
  end

  test "should create stru_expense_det" do
    assert_difference('StruExpenseDet.count') do
      post stru_expense_dets_url, params: { stru_expense_det: { amount: @stru_expense_det.amount, name: @stru_expense_det.name, structure_expense_id: @stru_expense_det.structure_expense_id, subtotal: @stru_expense_det.subtotal } }
    end

    assert_redirected_to stru_expense_det_url(StruExpenseDet.last)
  end

  test "should show stru_expense_det" do
    get stru_expense_det_url(@stru_expense_det)
    assert_response :success
  end

  test "should get edit" do
    get edit_stru_expense_det_url(@stru_expense_det)
    assert_response :success
  end

  test "should update stru_expense_det" do
    patch stru_expense_det_url(@stru_expense_det), params: { stru_expense_det: { amount: @stru_expense_det.amount, name: @stru_expense_det.name, structure_expense_id: @stru_expense_det.structure_expense_id, subtotal: @stru_expense_det.subtotal } }
    assert_redirected_to stru_expense_det_url(@stru_expense_det)
  end

  test "should destroy stru_expense_det" do
    assert_difference('StruExpenseDet.count', -1) do
      delete stru_expense_det_url(@stru_expense_det)
    end

    assert_redirected_to stru_expense_dets_url
  end
end
