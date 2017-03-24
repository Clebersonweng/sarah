Rails.application.routes.draw do
  resources :cost_oper_machine_cont_details
  resources :type_of_services
  resources :cost_oper_machine_conts
  resources :fuels
  resources :cost_oper_machine_details
  resources :cost_oper_machines
  resources :implements
  resources :machines
  resources :models
  resources :brands
  resources :type_of_works
  resources :man_power_details
  resources :man_powers
  resources :employees 
  root to: "home#index"

  resources :cons_raw_materials
  resources :cons_raw_material_details
  resources :supplies
  resources :program_productions
  resources :estimate_sales
  resources :farming_plots
  resources :type_of_crops
  devise_for :users
 
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :estimate_sales do
    resources :program_productions
  end
  #resources  :type_of_crops do
  #  resources :farming_plots
  #end
  resources :farming_plots, only: [:index]
  #resources :cons_raw_materials do
   # resources :cons_raw_material_details
 # end
end
