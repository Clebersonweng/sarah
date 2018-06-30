class ManuIndiExpensesController < ApplicationController

   before_action :authenticate_user!
   before_action :set_manu_indi_expense, only: [:show, :edit, :update, :destroy]

   # GET /manu_indi_expenses
   # GET /manu_indi_expenses.json
   def index
      get_all
      @manu_indi_expenses = ManuIndiExpense.all
   end

   # GET /manu_indi_expenses/1
   # GET /manu_indi_expenses/1.json
   def show
   end

   # GET /manu_indi_expenses/new
   def new
      get_all
      @manu_indi_expense      = ManuIndiExpense.new
      program                 = ProgramProduction.last()
      unless program.nil?
        @program_production_id  = program.id
      end
   end

   # GET /manu_indi_expenses/1/edit
   def edit
      get_all

      program                             = ProgramProduction.last()
      @program_production_id              = program.id

      @manu                               = ManuIndiExpense.find(params[:id])
      @manu_details                       = ManuIndiExpenseDet.where(manu_indi_expense_id: @manu.id)
      @total_fixed_and_variable           = @manu.totalFixedAndVariable
      @total_fixed                        = @manu.total_fixed
      @expense_total_varible              = @manu.total_variable
      

      return :json => {:contenido => @manu_details,:result => "edit"}

   end

   # POST /manu_indi_expenses
   # POST /manu_indi_expenses.json
   def create
      get_all      
      @manu_indi_expense = ManuIndiExpense.new(manu_indi_expense_params)
      puts manu_indi_expense_params
      if @manu_indi_expense.save
         render json: { contenido: @manu_indi_expense, location: manu_indi_expense_url(@manu_indi_expense),result: :ok },status: 200
      else
         render json:  @manu_indi_expense.errors, status: :unprocessable_entity 
      end
   end

   # PATCH/PUT /manu_indi_expenses/1
   # PATCH/PUT /manu_indi_expenses/1.json
   def update
      respond_to do |format|
         if @manu_indi_expense.update(manu_indi_expense_params)
            format.html { redirect_to @manu_indi_expense, notice: 'Manu indi expense was successfully updated.' }
            format.json { render :index, status: :ok, location: @manu_indi_expense }
         else
            format.html { render :edit }
            format.json { render json: @manu_indi_expense.errors, status: :unprocessable_entity }
         end
      end
   end

   # DELETE /manu_indi_expenses/1
   # DELETE /manu_indi_expenses/1.json
   def destroy
      @manu_indi_expense.destroy
      respond_to do |format|
         format.html { redirect_to manu_indi_expenses_url, notice: 'Manu indi expense was successfully destroyed.' }
         format.json { head :no_content }
      end
   end

   private
   # Use callbacks to share common setup or constraints between actions.
   def set_manu_indi_expense
      @manu_indi_expense = ManuIndiExpense.find(params[:id])
   end

   # Never trust parameters from the scary internet, only allow the white list through.
   def manu_indi_expense_params                                                                                                                 
      params.require(:manu_indi_expense).permit(:program_production_id, :chart_of_account_id, :total_fixed, :total_variable, :totalFixedAndVariable,{ manu_indi_expense_dets_attributes: [:name, :isFixed, :subtotal]})
   end
   def get_all
      @path             = " / crear estimación / gastos indirectos de producción"
      @edit_name        = "Editar gastos indirectos de produccción"
      @select_list      = { FIJO: 1, VARIABLE: 0 }
      @edit_name        = "Editar gastos indirectos de producción"
   end
end
