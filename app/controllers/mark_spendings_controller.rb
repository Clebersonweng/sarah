class MarkSpendingsController < ApplicationController

	before_action :authenticate_user!
	before_action :set_mark_spending, only: [:show, :edit, :update, :destroy]

	# GET /mark_spendings
	# GET /mark_spendings.json
	def index
		get_all
		@mark_spendings = MarkSpending.all
	end

	# GET /mark_spendings/1
	# GET /mark_spendings/1.json
	def show
	end

	# GET /mark_spendings/new
	def new
		get_all
		@mark_spending 					= MarkSpending.new
		program_production				= ProgramProduction.last()
	  
	   unless program_production.nil?
			@program_production_id		= program_production.id
			sale            	         = EstimateSale.find(program_production.estimate_sale_id)
			farm            	         = FarmingPlot.find(sale.farming_plot_id)

			@total_est_production 				= sale.total_production
			@farming_plot					= farm.name
		end 
		
	end

	# GET /mark_spendings/1/edit
	def edit
		get_all
		mark_spending                       = MarkSpending.find(params[:id]) 
      @mark_spending_details               = MarkSpendingDet.where(mark_spending_id: mark_spending.id)
		prog 				           	         = ProgramProduction.find(mark_spending.program_production_id)
		sales				           	         = EstimateSale.find(prog.estimate_sale_id)
		
		@program_production_id					= mark_spending.program_production_id
		@total_est_production					= prog.program_production
		@farming_plot								= sales.farming_plot.name
      @total_fixed                        = mark_spending.total_fixed
      @total_variable                     = mark_spending.total_variable
      @total                              = @mark_spending_details.sum(:subtotal)
	end

	# POST /mark_spendings
	# POST /mark_spendings.json
	def create
		@mark_spending = MarkSpending.new(mark_spending_params)

		respond_to do |format|
			if @mark_spending.save
				format.html { redirect_to @mark_spending, notice: 'Mark spending was successfully created.' }
				format.json { render :show, status: :created, location: @mark_spending }
			else
				format.html { render :new }
				format.json { render json: @mark_spending.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /mark_spendings/1
	# PATCH/PUT /mark_spendings/1.json
	def update
		respond_to do |format|
			if @mark_spending.update(mark_spending_params)
				format.html { redirect_to @mark_spending, notice: 'Mark spending was successfully updated.' }
				format.json { render :show, status: :ok, location: @mark_spending }
			else
				format.html { render :edit }
				format.json { render json: @mark_spending.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /mark_spendings/1
	# DELETE /mark_spendings/1.json
	def destroy
		@details = MarkSpendingDet.where(mark_spending_id: @mark_spending.id)
		@details.each do |det|
			det.destroy
		end
		@mark_spending.destroy

		respond_to do |format|
			format.html { redirect_to mark_spendings_url, notice: 'Mark spending was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_mark_spending
		@mark_spending = MarkSpending.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def mark_spending_params
		params.require(:mark_spending).permit(:program_production_id, :chart_of_account_id, :total,:total_fixed, :total_variable,mark_spending_dets_attributes: [:descr,:is_fixed,:amount,:subtotal ])
	end

	def get_all
		@type_expenses    = { FIJO: 1, VARIABLE: 0 } 
		@path           = " / crear estimación / gastos de comercialización"
		@edit_name      = "Editar gastos de comercialización"
	end

end
