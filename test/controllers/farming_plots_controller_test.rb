require 'test_helper'

class FarmingPlotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @farming_plot = farming_plots(:one)
  end

  test "should get index" do
    get farming_plots_url
    assert_response :success
  end

  test "should get new" do
    get new_farming_plot_url
    assert_response :success
  end

  test "should create farming_plot" do
    assert_difference('FarmingPlot.count') do
      post farming_plots_url, params: { farming_plot: { area: @farming_plot.area, code: @farming_plot.code, culture_period_end: @farming_plot.culture_period_end, culture_period_start: @farming_plot.culture_period_start, description: @farming_plot.description, name: @farming_plot.name, type_of_crop_id: @farming_plot.type_of_crop_id } }
    end

    assert_redirected_to farming_plot_url(FarmingPlot.last)
  end

  test "should show farming_plot" do
    get farming_plot_url(@farming_plot)
    assert_response :success
  end

  test "should get edit" do
    get edit_farming_plot_url(@farming_plot)
    assert_response :success
  end

  test "should update farming_plot" do
    patch farming_plot_url(@farming_plot), params: { farming_plot: { area: @farming_plot.area, code: @farming_plot.code, culture_period_end: @farming_plot.culture_period_end, culture_period_start: @farming_plot.culture_period_start, description: @farming_plot.description, name: @farming_plot.name, type_of_crop_id: @farming_plot.type_of_crop_id } }
    assert_redirected_to farming_plot_url(@farming_plot)
  end

  test "should destroy farming_plot" do
    assert_difference('FarmingPlot.count', -1) do
      delete farming_plot_url(@farming_plot)
    end

    assert_redirected_to farming_plots_url
  end
end
