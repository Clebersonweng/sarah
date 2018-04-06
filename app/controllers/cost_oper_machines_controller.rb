class CostOperMachinesController < ApplicationController
   before_action :authenticate_user!

   before_action :set_cost_oper_machine, only: [:show, :edit, :update, :destroy]

   respond_to :html

   def index
      get_all
      @cost_oper_machines = CostOperMachine.all
      respond_with(@cost_oper_machines)
   end

   def show
      respond_with(@cost_oper_machine)
   end

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
      @cost_oper_machine = CostOperMachine.new
      respond_with(@cost_oper_machine)
   end

   def edit
      get_all
      cost_oper_machine_master                 = CostOperMachine.find(params[:id])
      @cost_oper_machine_details               = CostOperMachineDetail.where(cost_oper_machine_id: cost_oper_machine_master.id)
      @program_production_id                   = cost_oper_machine_master.program_production_id
      @farm_name                               = cost_oper_machine_master.program_production.estimate_sale.farming_plot.name
      @farm_area                               = cost_oper_machine_master.program_production.estimate_sale.farming_plot.area
      @total                                   = cost_oper_machine_master.total
    end

   def create
      get_all
      @cost_oper_machine = CostOperMachine.new(cost_oper_machine_params)
      @cost_oper_machine.save
      respond_with(@cost_oper_machine)
   end

   def update
      get_all
      @cost_oper_machine.update(cost_oper_machine_params)
      respond_with(@cost_oper_machine)
   end

   def destroy
      @cost_oper_machine.destroy
      respond_with(@cost_oper_machine)
   end

   private
      def set_cost_oper_machine
      @cost_oper_machine = CostOperMachine.find(params[:id])
      end

      def cost_oper_machine_params
         params.require(:cost_oper_machine).permit(:program_production_id, :total,cost_oper_machine_details_attributes: [ :machine_id,:implement_id,:chart_of_account, :amount, :fuel, :lubricant, :repair_and_maintenance,:hours_needed, :subtotal])
      end
      def get_all
         #@farming_plots = FarmingPlot.all.collect { |p| [ p.name, p.id, {"data-area"=> p.area} ] }
         @machines = Machine.all.collect { |type| [type.name, type.id, {"data-hp"=> type.hp, "data-consumption" => type.consumption, "data-coef_cccr" => type.coeficient_cccr, "data-time_oper" => type.time_oper, "data-price" => type.price, "data-name" => type.name, "data-price_fuel" => type.fuel.price,"data-type_machine" => type.type_machine_id }]}
         @implements = Implement.all.collect {|p| [ p.get_all_names, p.id, {"data-oper_time"=>p.oper_time, "data-coef_cccr" => p.coef_cccr, "data-price" => p.price} ] }
         #@charts = ChartOfAccount.all.collect {|p| [ p.name, p.id, ] }
         @path = " / crear estimación / costo operativo maquinária propia"
      end
end
