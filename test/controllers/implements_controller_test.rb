require 'test_helper'

class ImplementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @implement = implements(:one)
  end

  test "should get index" do
    get implements_url
    assert_response :success
  end

  test "should get new" do
    get new_implement_url
    assert_response :success
  end

  test "should create implement" do
    assert_difference('Implement.count') do
      post implements_url, params: { implement: { coef_cccr: @implement.coef_cccr, machine_id: @implement.machine_id, model: @implement.model, name: @implement.name, oper_time: @implement.oper_time } }
    end

    assert_redirected_to implement_url(Implement.last)
  end

  test "should show implement" do
    get implement_url(@implement)
    assert_response :success
  end

  test "should get edit" do
    get edit_implement_url(@implement)
    assert_response :success
  end

  test "should update implement" do
    patch implement_url(@implement), params: { implement: { coef_cccr: @implement.coef_cccr, machine_id: @implement.machine_id, model: @implement.model, name: @implement.name, oper_time: @implement.oper_time } }
    assert_redirected_to implement_url(@implement)
  end

  test "should destroy implement" do
    assert_difference('Implement.count', -1) do
      delete implement_url(@implement)
    end

    assert_redirected_to implements_url
  end
end
