class IncomeStatementsController < ApplicationController
  	def index
  		@incomes = ProgramProduction.all
  	end
  	def get_income_statement
		farming_plot   = params[:farming_plot_id]
		@valor 			= ProgramProduction.result_income_statements(farming_plot)
      render json:   @valor
   end

end
