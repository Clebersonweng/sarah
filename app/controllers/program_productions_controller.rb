class ProgramProductionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_program_production, only: [:show, :edit, :update, :destroy]

  # GET /program_productions
  # GET /program_productions.json
  def index
    get_all
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
    get_all  
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
    get_all
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
    get_all
    @program_production = ProgramProduction.new(program_production_params)

    respond_to do |format|
      if @program_production.save
        format.html { redirect_to @program_production, notice: 'Creado con exito.' }
        format.json { render json: @program_production }
      else
        format.html { render :new }
        format.json { render json: @program_production.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /program_productions/1
  # PATCH/PUT /program_productions/1.json
  def update
    if @program_production.update(program_production_params)
      render json: { contenido: @program_production, location: program_production_url(@program_production),result: :ok },status: 200
    else
      render json:  @program_production.errors, status: :unprocessable_entity   
    end

  end

  # DELETE /program_productions/1
  # DELETE /program_productions/1.json
  def check_rel(_id)
    exist_relation = Supply.where(:program_production_id => _id)
    return true if exist_relation.count == 0
    false
  end

  def destroy
    @program_production        = ProgramProduction.find(params[:id]) 
    if check_rel(params[:id]) 
        respond_to do |format|
            if @program_production.destroy
              format.json { render json: @program_production }
            else
              render json: { contenido: @program_production, location: program_production_url(@program_production),message: :"no puede ser eliminado" },status: 400
            end
        end  
    else
      render json:  @program_production.errors, status: :bad_request 
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
  def get_all
    @path = "programa de producción"
  end
end
