Rails.application.routes.draw do
  resources :history_sales
  root to: "home#index"
  #match 'history_sales' => 'type_of_crops/history_sales', :via => :post
  
  #get 'new_type_of_crops', controller: 'type_of_crops', action: 'new' # nuevo tipo
  #get 'type_of_crops/:id', controller: 'type_of_crops', action: 'show', as: 'type_of_crop'# → recupera o contato com o identificador passado
  #patch 'type_of_crops/:id', controller: 'type_of_crops', action: 'update' #→ atualiza os dados do contato com as informações passadas
  #post 'type_of_crops', controller: 'type_of_crops', action: 'create' #→ cria um contato com os dados passados
  #delete 'type_of_crops/:id', controller: 'type_of_crops', action: 'destroy' #→ exclui o contato pelo identificador passado
  #get 'type_of_crops/:id/edit', controller: 'type_of_crops', action: 'edit', as: 'edit_type_of_crop_path'
  
  resources :type_of_crops
  
  resources :program_productions
  resources :people
  post 'estimate_sales/verify_new_estimate_sale'
  

  
  resources :farming_plots
  
  resources :manu_indi_expense_dets
  resources :manu_indi_expenses
  
  resources :stru_expense_dets
  resources :structure_expenses
  
  resources :mark_spending_dets
  resources :mark_spendings
  
  resources :supply_details
  resources :supplies
  
  resources :chart_of_accounts
   
  resources :cost_oper_machine_conts
  resources :cost_oper_machine_cont_details
  
  resources :type_of_services
  
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

  resources :estimate_sales

  resources :unit_of_measurements
  
  devise_for :users
 
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
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
