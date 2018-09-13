Rails.application.routes.draw do
  

  resources :depreciation_details
  resources :depreciations
  resources :revaluation_coefficients
   resources :man_power_details
   resources :cost_oper_machines
   resources :type_machines
   root to: "home#index"
   #match 'history_sales' => 'type_of_crops/history_sales', :via => :post


   resources :history_sales,:type_of_crops, :program_productions, :people , :farming_plots, :manu_indi_expense_dets, :manu_indi_expenses, :stru_expense_dets
   resources :structure_expenses, :mark_spending_dets, :mark_spendings, :supply_details, :supplies, :chart_of_accounts, :cost_oper_machine_conts
   resources :cost_oper_machine_cont_details, :type_of_services, :fuels,:cost_oper_machine_details,:cost_oper_machines, :implements
   resources :machines, :models, :brands, :type_of_works, :man_power_details, :man_powers, :products, :estimate_sales, :unit_of_measurements
   resources :varieties
   #resources :income_statements

   post 'estimate_sales/verify_new_estimate_sale'
   post 'estimate_sales/type_of_crop'
   post 'supplies/calculate_subtotal'
   post 'cost_oper_machine_conts/get_farming_plot'
   get  'income_statements/index'
   get "income_statements" => "income_statements#index"
   post 'income_statements/get_income_statement'
  
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

   resources :man_powers do
    resources :man_power_details
   end

   resources :manu_indi_expenses do
    resources :manu_indi_expense_dets
   end

   resources :supplies do
    resources :supply_details
   end
   
   resources :mark_spendings do
    resources :mark_spending_dets
   end
end
