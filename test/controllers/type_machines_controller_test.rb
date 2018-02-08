require 'test_helper'

class TypeMachinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_machine = type_machines(:one)
  end

  test "should get index" do
    get type_machines_url
    assert_response :success
  end

  test "should get new" do
    get new_type_machine_url
    assert_response :success
  end

  test "should create type_machine" do
    assert_difference('TypeMachine.count') do
      post type_machines_url, params: { type_machine: { code: @type_machine.code } }
    end

    assert_redirected_to type_machine_url(TypeMachine.last)
  end

  test "should show type_machine" do
    get type_machine_url(@type_machine)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_machine_url(@type_machine)
    assert_response :success
  end

  test "should update type_machine" do
    patch type_machine_url(@type_machine), params: { type_machine: { code: @type_machine.code } }
    assert_redirected_to type_machine_url(@type_machine)
  end

  test "should destroy type_machine" do
    assert_difference('TypeMachine.count', -1) do
      delete type_machine_url(@type_machine)
    end

    assert_redirected_to type_machines_url
  end
end
