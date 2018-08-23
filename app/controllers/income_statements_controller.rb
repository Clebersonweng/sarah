class IncomeStatementsController < ApplicationController

   def index
      get_all
      @incomes = ProgramProduction.all
   end

   def show  

   end

   def get_income_statement
      get_all
      program_production_id      = params[:program_production_id]
      @incomes 		      = ProgramProduction.result_income_statements(program_production_id)
      @resultado           = @incomes[0]
      render json:   @resultado
   end

   def get_all
      @path    = " / cuenta de resultados"
   end

end
