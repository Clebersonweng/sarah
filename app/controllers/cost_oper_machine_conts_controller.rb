class CostOperMachineContsController < ApplicationController
  before_action :set_cost_oper_machine_cont, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /cost_oper_machine_conts
  # GET /cost_oper_machine_conts.json
  def index
    @cost_oper_machine_conts = CostOperMachineCont.all
  end

  # GET /cost_oper_machine_conts/1
  # GET /cost_oper_machine_conts/1.json
  def show
  end

  # GET /cost_oper_machine_conts/new
  def new
    get_cost_machines_params
    @cost_oper_machine_cont = CostOperMachineCont.new    
  end

  # GET /cost_oper_machine_conts/1/edit
  def edit
    get_cost_machines_params
  end

  # POST /cost_oper_machine_conts
  # POST /cost_oper_machine_conts.json
  def create
    get_cost_machines_params
    @cost_oper_machine_cont = CostOperMachineCont.new(cost_oper_machine_cont_params)

    respond_to do |format|
      if @cost_oper_machine_cont.save
        format.html { redirect_to @cost_oper_machine_cont, notice: 'Cost oper machine cont was successfully created.' }
        format.json { render :show, status: :created, location: @cost_oper_machine_cont }
      else
        format.html { render :new }
        format.json { render json: @cost_oper_machine_cont.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cost_oper_machine_conts/1
  # PATCH/PUT /cost_oper_machine_conts/1.json
  def update
    
    respond_to do |format|
      if @cost_oper_machine_cont.update(cost_oper_machine_cont_params)
        format.html { redirect_to @cost_oper_machine_cont, notice: 'Cost oper machine cont was successfully updated.' }
        format.json { render :show, status: :ok, location: @cost_oper_machine_cont }
      else
        format.html { render :edit }
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
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cost_oper_machine_cont_params
    params.require(:cost_oper_machine_cont).permit(:farming_plot_id, :total,cost_oper_machine_cont_details_attributes: [:cost_oper_machine_cont, :type_of_service_id,:amount, :subtotal])
  end
  def get_cost_machines_params
    @farming_plots = FarmingPlot.all.collect {|p| [ p.name, p.id ] }
    @type_services = TypeOfService.all.collect {|p| [ p.name, p.id ,{"data-price"=> p.price, "data-u_measure"=>p.unit_of_measurement.name}] } 
    @unit_measure = UnitOfMeasurement.all.collect { |p| [p.name, p.id ]}
  end
end
