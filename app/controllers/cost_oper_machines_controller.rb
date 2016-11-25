class CostOperMachinesController < ApplicationController
  before_action :set_cost_oper_machine, only: [:show, :edit, :update, :destroy]

  # GET /cost_oper_machines
  # GET /cost_oper_machines.json
  def index
    @cost_oper_machines = CostOperMachine.all
  end

  # GET /cost_oper_machines/1
  # GET /cost_oper_machines/1.json
  def show
  end

  # GET /cost_oper_machines/new
  def new
    @cost_oper_machine = CostOperMachine.new
  end

  # GET /cost_oper_machines/1/edit
  def edit
  end

  # POST /cost_oper_machines
  # POST /cost_oper_machines.json
  def create
    @cost_oper_machine = CostOperMachine.new(cost_oper_machine_params)

    respond_to do |format|
      if @cost_oper_machine.save
        format.html { redirect_to @cost_oper_machine, notice: 'Cost oper machine was successfully created.' }
        format.json { render :show, status: :created, location: @cost_oper_machine }
      else
        format.html { render :new }
        format.json { render json: @cost_oper_machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cost_oper_machines/1
  # PATCH/PUT /cost_oper_machines/1.json
  def update
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
      params.require(:cost_oper_machine).permit(:farming_plot_id, :total)
    end
end
