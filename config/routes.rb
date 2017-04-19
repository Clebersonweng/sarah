Rails.application.routes.draw do
  resources :people
  resources :manu_indi_expense_dets
  resources :manu_indi_expenses
  resources :stru_expense_dets
  resources :structure_expenses
  resources :mark_spending_dets
  resources :mark_spendings
  resources :supply_details
  resources :supplies
  resources :chart_of_accounts
   root to: "home#index"
  resources :cost_oper_machine_conts
  resources :cost_oper_machine_cont_details
  resources :type_of_services
  resources :farming_plots
 # root to: "cost_oper_machine_cont_details#traer_programaProduccion"
  #get 'traer_programaProduccion/:id' => 'cost_oper_machine_conts#traer_programaProduccion'
  #post 'cost_oper_machine_conts/traer_programaProduccion'
  #get "/cost_oper_machine_conts#traer_programaProduccion/:idPrograma", to: "cost_oper_machine_conts#traer_programaProduccion"
  
  
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
 

  resources :products
  resources :program_productions
  resources :estimate_sales
  
  resources :type_of_crops
  devise_for :users
 
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :estimate_sales do
    resources :program_productions
  end
  #resources  :type_of_crops do
  #  resources :farming_plots
  #end
  #resources :farming_plots, only: [:index]
  
  resources :cost_oper_machines do
    resources :cost_oper_machine_details
  end
  
  resources :cost_oper_machine_conts do
    resources :cost_oper_machine_cont_details
    
  end
  #resources :cost_oper_machine_conts do
  #  get 'traer_programaProduccion' => ':cost_oper_machine_conts#traer_programaProduccion'
 # end
end
