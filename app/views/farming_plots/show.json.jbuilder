#json.partial! "farming_plots/farming_plot", farming_plot: @farming_plot

json.(@farming_plot, :code, :name, :area, :type_of_crop_id, :culture_period_start, :culture_period_end,:employee_id ,:description)
json.type_of_crop @farming_plot.type_of_crop, :id, :name
#partial
#json.farming_plots do
#  json.cache! @farming_plot do
#    json.partial! "farming_plot", farming_plots: @farming_plot
#  end
#end
