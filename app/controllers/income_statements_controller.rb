class IncomeStatementsController < ApplicationController
  	def index
  		@incomes = ProgramProduction.all
  	end
  	def get_income_statement
		farming_plot   = params[:farming_plot_id]
		@incomes 		= ProgramProduction.result_income_statements(farming_plot)
      @resultado 		= @incomes[0]
      render json:   @resultado
   end

end
