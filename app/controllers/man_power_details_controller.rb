class ManPowerDetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_man_power_detail, only: [:show, :edit, :update, :destroy]

  # GET /man_power_details
  # GET /man_power_details.json
  def index
    @man_power_details = ManPowerDetail.all
  end

  # GET /man_power_details/1
  # GET /man_power_details/1.json
  def show
  end

  # GET /man_power_details/new
  def new
    @man_power_detail = ManPowerDetail.new
  end

  # GET /man_power_details/1/edit
  def edit
  end

  # POST /man_power_details
  # POST /man_power_details.json
  def create
    @man_power_detail = ManPowerDetail.new(man_power_detail_params)

    respond_to do |format|
      if @man_power_detail.save
        format.html { redirect_to @man_power_detail, notice: 'Man power detail was successfully created.' }
        format.json { render :show, status: :created, location: @man_power_detail }
      else
        format.html { render :new }
        format.json { render json: @man_power_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /man_power_details/1
  # PATCH/PUT /man_power_details/1.json
  def update
    respond_to do |format|
      if @man_power_detail.update(man_power_detail_params)
        format.html { redirect_to @man_power_detail, notice: 'Man power detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @man_power_detail }
      else
        format.html { render :edit }
        format.json { render json: @man_power_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /man_power_details/1
  # DELETE /man_power_details/1.json
  def destroy
    @man_power_detail.destroy
    respond_to do |format|
      format.html { redirect_to man_power_details_url, notice: 'Man power detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_man_power_detail
      @man_power_detail = ManPowerDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def man_power_detail_params
      params.require(:man_power_detail).permit(:type_of_work_id,:hours_needed, :employee_id, :subtotal)
    end
end
