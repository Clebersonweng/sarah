json.farming_plots @farming_plots do |product|
  json.name product.name
  json.area  product.area
 
json.type_of_crops product.type_of_crop
end
