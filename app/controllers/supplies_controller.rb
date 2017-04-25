class SuppliesController < ApplicationController
  before_action :set_supply, only: [:show, :edit, :update, :destroy]

  # GET /supplies
  # GET /supplies.json
  def index
    @supplies = Supply.all
  end

  # GET /supplies/1
  # GET /supplies/1.json
  def show
  end

  # GET /supplies/new
  def new
    get_other_params
    @supply = Supply.new
    @program_production = ProgramProduction.new
    id_lastProgram = ProgramProduction.last()
    programId = ProgramProduction.find(id_lastProgram)
    @idUltimoPrograma = programId.id
  end

  # GET /supplies/1/edit
  def edit
    get_other_params
    @program_production = ProgramProduction.new
    id_ventas = EstimateSale.last()
    venta = EstimateSale.find(id_ventas)
    @ventasId = venta.id
  end

  # POST /supplies
  # POST /supplies.json
  def create
    get_other_params
    @supply = Supply.new(supply_params)

    respond_to do |format|
      if @supply.save
        format.html { redirect_to @supply, notice: 'Supply was successfully created.' }
        format.json { render :show, status: :created, location: @supply }
      else
        format.html { render :new }
        format.json { render json: @supply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supplies/1
  # PATCH/PUT /supplies/1.json
  def update
    respond_to do |format|
      if @supply.update(supply_params)
        format.html { redirect_to @supply, notice: 'Supply was successfully updated.' }
        format.json { render :show, status: :ok, location: @supply }
      else
        format.html { render :edit }
        format.json { render json: @supply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supplies/1
  # DELETE /supplies/1.json
  def destroy
    @supply.destroy
    respond_to do |format|
      format.html { redirect_to supplies_url, notice: 'Supply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supply
      @supply = Supply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supply_params
      params.require(:supply).permit(:program_production_id, :chart_of_account_id, :total)
    end
    def get_other_params
      @charts = ChartOfAccount.all.collect{|c| [c.name, c.id]}
      @programs = ProgramProduction.all.collect{|c| [c.program_production, c.id]}
    end
end
