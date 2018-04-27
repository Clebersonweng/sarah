class SuppliesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_supply, only: [:show, :edit, :update, :destroy]

	 # GET /supplies
	 # GET /supplies.json
	 def index
		get_all
		#@supplies = Supply.list_supply_and_detail
		@supplies = Supply.all

	 #@supply_details = SupplyDetail.all.where(supply_id: insumo)
	end

	 # GET /supplies/1
	 # GET /supplies/1.json
	 def show
	 end

	 # GET /supplies/new
	def new
		get_all
		@supply = Supply.new
		farming_plot = Supply.view_farming_plot_area

		last_id_prog_production = ProgramProduction.last()


		unless last_id_prog_production.nil?
			programId = ProgramProduction.find(last_id_prog_production)
			@program_production_id = programId.id
			@last_program_production_total = programId.program_production
		end

	 end

	 # GET /supplies/1/edit
	 def edit
		get_all
		supply = Supply.find(params[:id])
		@supply_details = SupplyDetail.where(supply_id: supply.id)
		@program_production_id                   = supply.program_production_id
		@farm_name                               = supply.program_production.estimate_sale.farming_plot.name
		@farm_area                               = supply.program_production.estimate_sale.farming_plot.area
		@quantity_production                     = supply.program_production.program_production
 
		@total                                   = @supply_details.sum(:subtotal)
		#@program_production = ProgramProduction.new
		#id_ventas = EstimateSale.last()

		#unless id_ventas.nil?
			#venta = EstimateSale.find(id_ventas)
			#@ventasId = venta.id
		#end
	 end

	 # POST /supplies
	 # POST /supplies.json
	 def create
	 #get_all

 		@supply = Supply.new(supply_params)
 		respond_to do |format|
					if @supply.save
					#format.html { redirect_to @supply, notice: 'Supply was successfully created.' }
						format.json { render json: @supply }
					else
						#format.html { render :new }
						format.json { render json: @supply.errors, status: :unprocessable_entity }
					end
		end
	end

	 # PATCH/PUT /supplies/1
	 # PATCH/PUT /supplies/1.json
	 def update
		respond_to do |format|
			if @supply.update(supply_params)
					#format.html { redirect_to @supply, notice: 'Supply was successfully updated.' }
					format.json { render :show, status: :ok, location: @supply }
				else
					#format.html { render :edit }
					format.json { render json: @supply.errors, status: :unprocessable_entity }
				end
			end
		end

	 # DELETE /supplies/1
	 # DELETE /supplies/1.json
	 def destroy
		@details = SupplyDetail.where(supply_id: @supply.id)
		@details.each do |det|
			det.destroy
		end
		@supply.destroy
	 end

	 def calculate_subtotal

		@calc_container     = Supply.view_farming_plot_area()

		respond_to do |format|
			if @calc_container.present?
						 #format.html { redirect_to @unit_of_measurements, notice: 'Unidad de medida actualizada con exito.' }
						 format.json { render json: @calc_container, status: :ok, msg:"success" }
						else
						 #format.html { render :new }
						 format.json { render json: calc_container, status: :error, msg:"Ya existe este tipo de cultivo para el periodo." }
						end
					end
				end


				private
			# Use callbacks to share common setup or constraints between actions.
			def set_supply
				@supply = Supply.find(params[:id])
			end

			# Never trust parameters from the scary internet, only allow the white list through.
			def supply_params
				params.require(:supply).permit(:program_production_id, :chart_of_account_id, :total,supply_details_attributes:[:product_id, :quantity_needed, :subtotal])
			end

			def get_all
				@charts = ChartOfAccount.all.collect{|c| [c.name, c.id]}
				@programs = ProgramProduction.all.collect{|c| [c.program_production, c.id]}
				@products = Product.all.collect { |p| [ p.tradename, p.id, {"data-price"=> p.price, "data-dosage" => p.dosage,"data-measure" => p.unit_of_measurement.abbreviation} ] }
				@path = " / crear estimación / insumos"
				 @edit_name      = "Editar insumo"
			end
		end
