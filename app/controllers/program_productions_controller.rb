class ProgramProductionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_program_production, only: [:show, :edit, :update, :destroy]

  # GET /program_productions
  # GET /program_productions.json
  def index
    @program_productions = ProgramProduction.all.sort()
    respond_to do |format|
      format.html
      format.json { render json: @program_productions.as_json(:include => { :estimate_sale => { :only => :code }}) }
    end
  end

  # GET /program_productions/1
  # GET /program_productions/1.json
  def show
  end

  # GET /program_productions/new
  def new   
    @program_production = ProgramProduction.new
    id_ventas = EstimateSale.last()
    venta = EstimateSale.find(id_ventas)
    @sales_id = venta.id
    @sales_total_production = venta.total_production
    @sales_farming_plot = venta.farming_plot.name   
    @sales_area = venta.farming_plot.area   
  end

  # GET /program_productions/1/edit
  def edit
    id_ventas = EstimateSale.last()
    venta = EstimateSale.find(id_ventas)
    @sales_id = venta.id
    @sales_total_production = venta.total_production
    @sales_farming_plot = venta.farming_plot.name   
    @sales_area = venta.farming_plot.area  
  end

  # POST /program_productions
  # POST /program_productions.json
  def create
    get_other_params
    @program_production = ProgramProduction.create(program_production_params)

    respond_to do |format|
      if @program_production.save
        #format.js
        flash[:notice] = "Fue creado el registro exitosamente"
        format.html { redirect_to  action:"index"}
      else
        #format.js
        flash[:alert] = "Ocurrió un error al crear el registro"
        format.html { redirect_to  action:"edit"}
      end
    end
  end

  # PATCH/PUT /program_productions/1
  # PATCH/PUT /program_productions/1.json
  def update
    respond_to do |format|
      if @program_production.update(program_production_params)
        flash[:notice] = "El registro fue guardado exitosamente!"
        format.html { redirect_to  action:"index"}
      else
        flash[:notice] = "Ha ocurrido un error al guardar!"
        format.html { redirect_to  action:"edit"}
      end
    end
  end

  # DELETE /program_productions/1
  # DELETE /program_productions/1.json
  def destroy
    @program_production = ProgramProduction.find(params[:id])  
    respond_to do |format|
      if(@program_production.destroy)      
        format.json { head :no_content, message:"Registro eliminado existosamente.", response:"ok" }
      else
        format.json { head :no_content, message:"Ocurrió un error al eliminar.",response:"error"}
      end
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
  def get_other_params
    # @sales = EstimateSale.last()
  end
end
