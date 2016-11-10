class ProgramProductionsController < ApplicationController
  before_action :set_program_production, only: [:show, :edit, :update, :destroy]

  # GET /program_productions
  # GET /program_productions.json
  def index
    @program_productions = ProgramProduction.all
  end

  # GET /program_productions/1
  # GET /program_productions/1.json
  def show
  end

  # GET /program_productions/new
  def new
    @program_production = ProgramProduction.new
    #@get_last_estimate_and_farming_plot = EstimateSale.all.collect{|type| [type.farming_plot_id.name, type.id]}
  end

  # GET /program_productions/1/edit
  def edit
  end

  # POST /program_productions
  # POST /program_productions.json
  def create
    
    @program_production = ProgramProduction.create(program_production_params)

    respond_to do |format|
      if @program_production.save
        format.html { redirect_to @program_production, notice: 'Program production was successfully created.' }
        format.json { render :show, status: :created, location: @program_production }
      else
        format.html { render :new }
        format.json { render json: @program_production.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /program_productions/1
  # PATCH/PUT /program_productions/1.json
  def update
    respond_to do |format|
      if @program_production.update(program_production_params)
        format.html { redirect_to @program_production, notice: 'Program production was successfully updated.' }
        format.json { render :show, status: :ok, location: @program_production }
      else
        format.html { render :edit }
        format.json { render json: @program_production.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /program_productions/1
  # DELETE /program_productions/1.json
  def destroy
    @program_production.destroy
    respond_to do |format|
      format.html { redirect_to program_productions_url, notice: 'Program production was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program_production
      @program_production = ProgramProduction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def program_production_params
      params.require(:program_production).permit(:estimate_sale_id, :stock_initial, :stock_end, :variation_stock, :program_production)
    end
end
