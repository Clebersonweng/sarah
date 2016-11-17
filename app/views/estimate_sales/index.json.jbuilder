
json.estimate_sales @estimate_sales do |estimate|
  json.id estimate.id
  json.farming_plot_id estimate.farming_plot_id
  json.estimate_production estimate.estimate_production
  json.total_production estimate.total_production
  json.price estimate.price
  json.gross_sale estimate.gross_sale
  
 json.farming_plots estimate.farming_plot do |farm|
    json.(farm, :id, :name)
 end
end
