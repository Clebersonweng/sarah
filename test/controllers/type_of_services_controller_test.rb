require 'test_helper'

class TypeOfServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_of_service = type_of_services(:one)
  end

  test "should get index" do
    get type_of_services_url
    assert_response :success
  end

  test "should get new" do
    get new_type_of_service_url
    assert_response :success
  end

  test "should create type_of_service" do
    assert_difference('TypeOfService.count') do
      post type_of_services_url, params: { type_of_service: { description: @type_of_service.description, name: @type_of_service.name, price: @type_of_service.price } }
    end

    assert_redirected_to type_of_service_url(TypeOfService.last)
  end

  test "should show type_of_service" do
    get type_of_service_url(@type_of_service)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_of_service_url(@type_of_service)
    assert_response :success
  end

  test "should update type_of_service" do
    patch type_of_service_url(@type_of_service), params: { type_of_service: { description: @type_of_service.description, name: @type_of_service.name, price: @type_of_service.price } }
    assert_redirected_to type_of_service_url(@type_of_service)
  end

  test "should destroy type_of_service" do
    assert_difference('TypeOfService.count', -1) do
      delete type_of_service_url(@type_of_service)
    end

    assert_redirected_to type_of_services_url
  end
end
