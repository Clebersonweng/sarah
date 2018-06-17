class CostOperMachineContsController < ApplicationController
	#
	# Costo operativo de maquinaria tercerizada
	#
	before_action :authenticate_user!
	before_action :set_cost_oper_machine_cont, only: [:show, :edit, :update, :destroy]  

	# GET /cost_oper_machine_conts
	# GET /cost_oper_machine_conts.json
	def index
		get_all 
		@cost_oper_machine_conts = CostOperMachineCont.all
		#@cost_oper_machine_conts = CostOperMachineCont.get_list_cost_outsourced
	end
	# GET /cost_oper_machine_conts/1
	# GET /cost_oper_machine_conts/1.json
	def show
	end

	# GET /cost_oper_machine_conts/new
	def new
		get_all
		@cost_oper_machine_cont = CostOperMachineCont.new
		program_production                 = ProgramProduction.last()
		unless program_production.nil?

			@quantity_production    = program_production.program_production
			@program_production_id  = program_production.id
			sale                    = EstimateSale.find(program_production.estimate_sale_id)
			farm                    = FarmingPlot.find(sale.farming_plot_id)
			@farm_name              = farm.name
			@farm_area              = farm.area
		end
	end

	def get_farming_plot()

		@result = CostOperMachineCont.get_farming_plot()
		
		respond_to do |format|
			if @result.present?
				format.json { render json: @result, status: :ok, msg:"success" }
			else
				format.json { render json: @result, status: :error, msg:"Ocurrió un error al traer los datos de la parcela xx" }
			end
		end
	end

	# GET /cost_oper_machine_conts/1/edit
	def edit
		get_all
		cost_oper_machine_cont_master            = CostOperMachineCont.find(params[:id])
		@cost_oper_machine_cont_details          = CostOperMachineContDetail.where(cost_oper_machine_cont_id: cost_oper_machine_cont_master.id)
		@program_production_id                   = cost_oper_machine_cont_master.program_production_id
		@farm_name                               = cost_oper_machine_cont_master.program_production.estimate_sale.farming_plot.name
		@farm_area                               = cost_oper_machine_cont_master.program_production.estimate_sale.farming_plot.area
		@quantity_production                     = cost_oper_machine_cont_master.program_production.program_production
		@total                                   = @cost_oper_machine_cont_details.sum(:subtotal)
	end

	# POST /cost_oper_machine_conts
	# POST /cost_oper_machine_conts.json
	def create
		get_all
		@cost_oper_machine_cont = CostOperMachineCont.new(cost_oper_machine_cont_params)
		
		if @cost_oper_machine_cont.save
			render json: { contenido: @cost_oper_machine_cont, location: cost_oper_machine_cont_url(@cost_oper_machine_cont),result: :ok },status: 200
		else
			render json:  @cost_oper_machine_cont.errors, status: :unprocessable_entity 
		end
	end

  # PATCH/PUT /cost_oper_machine_conts/1
  # PATCH/PUT /cost_oper_machine_conts/1.json
  def update
  	get_all
  	respond_to do |format|
  		if @cost_oper_machine_cont.update(cost_oper_machine_cont_params)
			  #format.html { redirect_to @cost_oper_machine_cont, notice: 'Cost oper machine cont was successfully updated.' }
			  format.json { render :show, status: :ok, location: @cost_oper_machine_cont }
			else
			  #format.html { render :edit }
			  format.json { render json: @cost_oper_machine_cont.errors, status: :unprocessable_entity }
			end
		end
	end

  # DELETE /cost_oper_machine_conts/1
  # DELETE /cost_oper_machine_conts/1.json
  def destroy
  	@cost_oper_machine_cont.destroy
  	respond_to do |format|
  		format.html { redirect_to cost_oper_machine_conts_url, notice: 'Cost oper machine cont was successfully destroyed.' }
  		format.json { head :no_content }
  	end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cost_oper_machine_cont
  	@cost_oper_machine_cont = CostOperMachineCont.find(params[:id])
		# @traerPrograma = CostOperMachineCont.find(params[:idPrograma])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def cost_oper_machine_cont_params
		params.require(:cost_oper_machine_cont).permit(:program_production_id, :total, cost_oper_machine_cont_details_attributes: [:type_of_service_id,:amount, :subtotal])
	end

	def get_all
		# @programs = CostOperMachineCont.program_production.collect {|p| [ p.program_production, p.id ] }
		@type_services = TypeOfService.all.collect {|p| [ p.name, p.id ,{"data-price"=> p.price, "data-u_measure"=>p.unit_of_measurement.name}] } 
		@implements   = Implement.all.collect {|p| [ p.name, p.id ,{"data-oper_time"=> p.oper_time }] } 
		@unit_measure = UnitOfMeasurement.all.collect { |p| [p.name, p.id ]}
		@path = " / crear estimación / costo operativo de máquinas tercerizadas"
	  	@edit_name = "Editar costo operativo de máquina tercerizada"
	end
end
