class CostOperMachinesController < ApplicationController
   before_action :set_cost_oper_machine, only: [:show, :edit, :update, :destroy]
   before_action :authenticate_user!
   # GET /cost_oper_machines
   # GET /cost_oper_machines.json
   def index
      get_all
      @cost_oper_machines = CostOperMachine.all     
   end

   # GET /cost_oper_machines/1
   # GET /cost_oper_machines/1.json
   def show
   end

   # GET /cost_oper_machines/new
   def new
      get_all
      @cost_oper_machine = CostOperMachine.new
      program                 = ProgramProduction.last()
      @quantity_production    = program.program_production
      @program_production_id  = program.id
      sale                    = EstimateSale.find(program.estimate_sale_id)
      farm                    = FarmingPlot.find(sale.farming_plot_id)
      @farm_name              = farm.name
      @farm_area              = farm.area
   end

   # GET /cost_oper_machines/1/edit
   def edit
      get_cost_oper_machine_params
   end

   # POST /cost_oper_machines
   # POST /cost_oper_machines.json
   def create
      get_cost_oper_machine_params
      @cost_oper_machine = CostOperMachine.new(cost_oper_machine_params)
      #render :text => @cost_oper_machine.inspect
      respond_to do |format|
         if @cost_oper_machine.save
            format.html { redirect_to @cost_oper_machine, notice: 'Cost oper machine was successfully created.' }
            format.json { render :show, status: :created, location: @cost_oper_machine }
         else
            format.html { render :new }
            #format.json { render json: @cost_oper_machine.errors, status: :unprocessable_entity }
         end
      end
   end

   # PATCH/PUT /cost_oper_machines/1
   # PATCH/PUT /cost_oper_machines/1.json
   def update
      get_cost_oper_machine_params
      respond_to do |format|
         if @cost_oper_machine.update(cost_oper_machine_params)
            format.html { redirect_to @cost_oper_machine, notice: 'Cost oper machine was successfully updated.' }
            format.json { render :show, status: :ok, location: @cost_oper_machine }
         else
            format.html { render :edit }
            format.json { render json: @cost_oper_machine.errors, status: :unprocessable_entity }
         end
      end
   end

   # DELETE /cost_oper_machines/1
   # DELETE /cost_oper_machines/1.json
   def destroy
      @cost_oper_machine =  CostOperMachine.find(params [:id])
      @cost_oper_machine.destroy
      respond_to do |format|
         format.html { redirect_to cost_oper_machines_url, notice: 'Cost oper machine was successfully destroyed.' }
         format.json { head :no_content }
      end
   end

   private
   # Use callbacks to share common setup or constraints between actions.
   def set_cost_oper_machine
      @cost_oper_machine = CostOperMachine.find(params[:id])
   end

   # Never trust parameters from the scary internet, only allow the white list through.
   def cost_oper_machine_params
      params.require(:cost_oper_machine).permit(:farming_plot_id, :total, cost_oper_machine_details_attributes: [ :machine_id,:implement_id,:chart_of_account, :amount, :fuel, :lubricant, :repair_and_maintenance, :subtotal])
   end
   def get_all
      @farming_plots = FarmingPlot.all.collect { |p| [ p.name, p.id, {"data-area"=> p.area} ] }
      @machines = Machine.all.collect { |type| [type.name, type.id, {"data-hp"=> type.hp, "data-consumption" => type.consumption, "data-coef_cccr" => type.coeficient_cccr, "data-time_oper" => type.time_oper, "data-price" => type.price, "data-name" => type.name, "data-price_fuel" => type.fuel.price }]}
      @implements = Implement.all.collect {|p| [ p.get_all_names, p.id, {"data-oper_time"=>p.oper_time, "data-coef_cccr" => p.coef_cccr, "data-price" => p.price} ] }
      #@charts = ChartOfAccount.all.collect {|p| [ p.name, p.id, ] }
      @path = " / crear estimación / costo operativo maquinária propia"
   end
end
