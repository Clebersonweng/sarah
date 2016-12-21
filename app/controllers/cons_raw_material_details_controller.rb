class ConsRawMaterialDetailsController < ApplicationController
  before_action :set_cons_raw_material_detail, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /cons_raw_material_details
  # GET /cons_raw_material_details.json
  def index
    @cons_raw_material_details = ConsRawMaterialDetail.all
  end

  # GET /cons_raw_material_details/1
  # GET /cons_raw_material_details/1.json
  def show
  end

  # GET /cons_raw_material_details/new
  def new
    @cons_raw_material_detail = ConsRawMaterialDetail.new
  end

  # GET /cons_raw_material_details/1/edit
  def edit
  end

  # POST /cons_raw_material_details
  # POST /cons_raw_material_details.json
  def create
    @cons_raw_material_detail = ConsRawMaterialDetail.new(cons_raw_material_detail_params)

    respond_to do |format|
      if @cons_raw_material_detail.save
        format.html { redirect_to @cons_raw_material_detail, notice: 'Cons raw material detail was successfully created.' }
        format.json { render :show, status: :created, location: @cons_raw_material_detail }
      else
        format.html { render :new }
        format.json { render json: @cons_raw_material_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cons_raw_material_details/1
  # PATCH/PUT /cons_raw_material_details/1.json
  def update
    respond_to do |format|
      if @cons_raw_material_detail.update(cons_raw_material_detail_params)
        format.html { redirect_to @cons_raw_material_detail, notice: 'Cons raw material detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @cons_raw_material_detail }
      else
        format.html { render :edit }
        format.json { render json: @cons_raw_material_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cons_raw_material_details/1
  # DELETE /cons_raw_material_details/1.json
  def destroy
    @cons_raw_material_detail.destroy
    respond_to do |format|
      format.html { redirect_to cons_raw_material_details_url, notice: 'Cons raw material detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cons_raw_material_detail
    @cons_raw_material_detail = ConsRawMaterialDetail.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cons_raw_material_detail_params
    params.require(:cons_raw_material_detail).permit(:cons_raw_material_id, :supply_id, :total_unit, :subtotal)
  end
end
