class CostOperMachineContDetailsController < ApplicationController
  before_action :set_cost_oper_machine_cont_detail, only: [:show, :edit, :update, :destroy]

  # GET /cost_oper_machine_cont_details
  # GET /cost_oper_machine_cont_details.json
  def index
    @cost_oper_machine_cont_details = CostOperMachineContDetail.all

  # post = CostOperMachineCont.find(params[:cost_oper_machine_cont_id])
  # @cost_oper_machine_cont_details = post.cost_oper_machine_cont_details
  end

  # GET /cost_oper_machine_cont_details/1
  # GET /cost_oper_machine_cont_details/1.json
  def show
  end

  # GET /cost_oper_machine_cont_details/new
  def new
    @cost_oper_machine_cont_detail = CostOperMachineContDetail.new
  end

  # GET /cost_oper_machine_cont_details/1/edit
  def edit
  end

  # POST /cost_oper_machine_cont_details
  # POST /cost_oper_machine_cont_details.json
  def create
    @cost_oper_machine_cont_detail = CostOperMachineContDetail.new(cost_oper_machine_cont_detail_params)

    respond_to do |format|
      if @cost_oper_machine_cont_detail.save
        format.html { redirect_to @cost_oper_machine_cont_detail, notice: 'Cost oper machine cont detail was successfully created.' }
        format.json { render :show, status: :created, location: @cost_oper_machine_cont_detail }
      else
        format.html { render :new }
        format.json { render json: @cost_oper_machine_cont_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cost_oper_machine_cont_details/1
  # PATCH/PUT /cost_oper_machine_cont_details/1.json
  def update
    respond_to do |format|
      if @cost_oper_machine_cont_detail.update(cost_oper_machine_cont_detail_params)
        #format.html { redirect_to @cost_oper_machine_cont_detail, notice: 'Cost oper machine cont detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @cost_oper_machine_cont_detail }
      else
       # format.html { render :edit }
        format.json { render json: @cost_oper_machine_cont_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cost_oper_machine_cont_details/1
  # DELETE /cost_oper_machine_cont_details/1.json
  def destroy
    @cost_oper_machine_cont_detail.destroy
    respond_to do |format|
      format.html { redirect_to cost_oper_machine_cont_details_url, notice: 'Cost oper machine cont detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cost_oper_machine_cont_detail
      @cost_oper_machine_cont_detail = CostOperMachineContDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cost_oper_machine_cont_detail_params
      params.require(:cost_oper_machine_cont_detail).permit(:type_of_service_id, :amount, :subtotal)
    end
end
