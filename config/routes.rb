Rails.application.routes.draw do
  
  root to: "home#index"
  #match 'history_sales' => 'type_of_crops/history_sales', :via => :post
  
  
  resources :history_sales,:type_of_crops, :program_productions, :people , :farming_plots, :manu_indi_expense_dets, :manu_indi_expenses, :stru_expense_dets
  resources :structure_expenses, :mark_spending_dets, :mark_spendings, :supply_details, :supplies, :chart_of_accounts, :cost_oper_machine_conts
  resources :cost_oper_machine_cont_details, :type_of_services, :fuels,:cost_oper_machine_details,:cost_oper_machines, :implements
  resources :machines, :models, :brands, :type_of_works, :man_power_details, :man_powers, :products, :estimate_sales, :unit_of_measurements
  resources :varieties
  
  post 'estimate_sales/verify_new_estimate_sale'

  devise_for :users

  resources :program_productions do
    resources :estimate_sales #-> url.com/logs/:log_id/meals/:id
  end
  
  resources :cost_oper_machines do
    resources :cost_oper_machine_details
  end
  
  resources :cost_oper_machine_conts do
    resources :cost_oper_machine_cont_details
  end
  resources :supplies do
    resources :supply_details
  end

end
