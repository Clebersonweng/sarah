class SupplyDetailsController < ApplicationController
  before_action :set_supply_detail, only: [:show, :edit, :update, :destroy]

  # GET /supply_details
  # GET /supply_details.json
  def index
    @supply_details = SupplyDetail.all
  end

  # GET /supply_details/1
  # GET /supply_details/1.json
  def show
  end

  # GET /supply_details/new
  def new
    @supply_detail = SupplyDetail.new
  end

  # GET /supply_details/1/edit
  def edit
  end

  # POST /supply_details
  # POST /supply_details.json
  def create
    @supply_detail = SupplyDetail.new(supply_detail_params)

    respond_to do |format|
      if @supply_detail.save
        format.html { redirect_to @supply_detail, notice: 'Supply detail was successfully created.' }
        format.json { render :show, status: :created, location: @supply_detail }
      else
        format.html { render :new }
        format.json { render json: @supply_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supply_details/1
  # PATCH/PUT /supply_details/1.json
  def update
    respond_to do |format|
      if @supply_detail.update(supply_detail_params)
        format.html { redirect_to @supply_detail, notice: 'Supply detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @supply_detail }
      else
        format.html { render :edit }
        format.json { render json: @supply_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supply_details/1
  # DELETE /supply_details/1.json
  def destroy
    @supply_detail.destroy
    respond_to do |format|
      format.html { redirect_to supply_details_url, notice: 'Supply detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supply_detail
      @supply_detail = SupplyDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supply_detail_params
      params.require(:supply_detail).permit(:supply_id, :product_id, :quantity_needed, :subtotal)
    end
end
