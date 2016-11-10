require 'test_helper'

class TypeOfCropsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_of_crop = type_of_crops(:one)
  end

  test "should get index" do
    get type_of_crops_url
    assert_response :success
  end

  test "should get new" do
    get new_type_of_crop_url
    assert_response :success
  end

  test "should create type_of_crop" do
    assert_difference('TypeOfCrop.count') do
      post type_of_crops_url, params: { type_of_crop: { code: @type_of_crop.code, name: @type_of_crop.name, variety: @type_of_crop.variety } }
    end

    assert_redirected_to type_of_crop_url(TypeOfCrop.last)
  end

  test "should show type_of_crop" do
    get type_of_crop_url(@type_of_crop)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_of_crop_url(@type_of_crop)
    assert_response :success
  end

  test "should update type_of_crop" do
    patch type_of_crop_url(@type_of_crop), params: { type_of_crop: { code: @type_of_crop.code, name: @type_of_crop.name, variety: @type_of_crop.variety } }
    assert_redirected_to type_of_crop_url(@type_of_crop)
  end

  test "should destroy type_of_crop" do
    assert_difference('TypeOfCrop.count', -1) do
      delete type_of_crop_url(@type_of_crop)
    end

    assert_redirected_to type_of_crops_url
  end
end
