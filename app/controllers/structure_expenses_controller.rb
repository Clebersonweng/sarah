class StructureExpensesController < ApplicationController

	before_action :authenticate_user!
	before_action :set_structure_expense, only: [:show, :edit, :update, :destroy]

	# GET /structure_expenses
	# GET /structure_expenses.json
	def index
		get_all
		@structure_expenses = StructureExpense.all
	end

	# GET /structure_expenses/1
	# GET /structure_expenses/1.json
	def show
	end

	# GET /structure_expenses/new
	def new
		detalles
		get_all
		@structure_expense      = StructureExpense.new
		program                 = ProgramProduction.last()
		@program_production_id  = program.id
	end

	# GET /structure_expenses/1/edit
	def edit
		get_all
		exp_structure_master                     = StructureExpense.find(params[:id])
		@structure_details                       = StruExpenseDet.where(structure_expense_id: exp_structure_master.id)
		@total                                   = @structure_details.sum(:subtotal)

		@program_production_id                   = exp_structure_master.program_production_id
	end

	# POST /structure_expenses
	# POST /structure_expenses.json
	def create
		@structure_expense = StructureExpense.new(structure_expense_params)

		respond_to do |format|
			if @structure_expense.save
				#format.html { redirect_to @structure_expense, notice: 'Structure expense was successfully created.' }
				format.json { render :show, status: :created, location: @structure_expense }
			else
				#format.html { render :new }
				format.json { render json: @structure_expense.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /structure_expenses/1
	# PATCH/PUT /structure_expenses/1.json
	def update
		respond_to do |format|
			if @structure_expense.update(structure_expense_params)
				#format.html { redirect_to @structure_expense, notice: 'Structure expense was successfully updated.' }
				format.json { render :show, status: :ok, location: @structure_expense }
			else
				#format.html { render :edit }
				format.json { render json: @structure_expense.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /structure_expenses/1
	# DELETE /structure_expenses/1.json
	def destroy
		@structure_expense.destroy
		respond_to do |format|
			#f#ormat.html { redirect_to structure_expenses_url, notice: 'Structure expense was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	def detalles

	end


	private
	# Use callbacks to share common setup or constraints between actions.
	def set_structure_expense
		@structure_expense = StructureExpense.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def structure_expense_params
		params.require(:structure_expense).permit(:program_production_id, :total,{ stru_expense_dets_attributes: [:name, :amount, :subtotal]})
	end
	def get_all
		@path = " / crear estimación / gastos de estructura"
		@edit_name = "Editar gastos de estructura"
	end

end
