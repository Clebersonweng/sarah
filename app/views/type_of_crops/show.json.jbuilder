json.(@type_of_crop, :id, :name, :create_at)
json.farming_plots(@type_of_crop.farming_plots, :id, :name)