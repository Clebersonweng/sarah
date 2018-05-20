class IncomeStatementsController < ApplicationController
  	
  	def index
  		get_all
  		@incomes = ProgramProduction.all
  	end

  	def get_income_statement
  		get_all
		farming_plot   = params[:farming_plot_id]
		@incomes 		= ProgramProduction.result_income_statements(farming_plot)
      @resultado 		= @incomes[0]
      render json:   @resultado
   end

   def get_all
  		@path = " / cuenta de resultados"
   end

end
