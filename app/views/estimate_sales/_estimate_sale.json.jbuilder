json.estimate_sale  @estimate_sales do |estimate|
  json.farming_plot_id estimate.farming_plot_id
  json.estimate_production  estimate.estimate_production
  json.total_production estimate.total_production
  json.price estimate.price
  json.gross_sale estimate.gross_sale


  json.estimate_sales estimate_sale.farming_plot do |review|
    json.name review.name
 





end


