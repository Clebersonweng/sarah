require 'test_helper'

class TypeOfWorksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_of_work = type_of_works(:one)
  end

  test "should get index" do
    get type_of_works_url
    assert_response :success
  end

  test "should get new" do
    get new_type_of_work_url
    assert_response :success
  end

  test "should create type_of_work" do
    assert_difference('TypeOfWork.count') do
      post type_of_works_url, params: { type_of_work: { description: @type_of_work.description, name: @type_of_work.name, price_hours: @type_of_work.price_hours } }
    end

    assert_redirected_to type_of_work_url(TypeOfWork.last)
  end

  test "should show type_of_work" do
    get type_of_work_url(@type_of_work)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_of_work_url(@type_of_work)
    assert_response :success
  end

  test "should update type_of_work" do
    patch type_of_work_url(@type_of_work), params: { type_of_work: { description: @type_of_work.description, name: @type_of_work.name, price_hours: @type_of_work.price_hours } }
    assert_redirected_to type_of_work_url(@type_of_work)
  end

  test "should destroy type_of_work" do
    assert_difference('TypeOfWork.count', -1) do
      delete type_of_work_url(@type_of_work)
    end

    assert_redirected_to type_of_works_url
  end
end
