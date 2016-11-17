
# app/views/farming_plot/index.json.jbuilder
json.array! @farming_plots, partial: 'farming_plots/farming_plot', as: :farming_plot

#partial
#json.farming_plots @farming_plot do
 #json.cache! farming_plot do
#    json.partial! "farming_plots", farming_plot: farming_plot
#  end
#end
#json.partial! 'farming_plots/list', farming_plots: @farming_plots
   
#end