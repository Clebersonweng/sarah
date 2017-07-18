class EstimateSalesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_estimate_sale, only: [:show, :edit, :update, :destroy]
  # GET /estimate_sales
  # GET /estimate_sales.json
  def index
    @estimate_sales = EstimateSale.all
    #@estimate_sales = EstimateSale.all 
    respond_to do |format|
      format.html
      format.json { render json: @estimate_sales.as_json(only: [:id, :code, :date_init,:date_end,:estimate_production,:total_production,:"['farming_plot']['name']",:price,:gross_sale],:include => { :farming_plot => { :only => :name }}) }
    end
  end

  # GET /estimate_sales/1
  # GET /estimate_sales/1.json
  def show
  end
  
  #verifica que no exista un mismo tipo de cultivo para un mismo periodo
  def verify_new_estimate_sale
    
    @date_init        = params[:date_init]
    @date_end         = params[:date_end]
    @farming_plot_id  = params[:farming_plot_id]
    @type_of_crop_id  = params[:type_of_crop_id]
    valor = EstimateSale.validate_periods(@farming_plot_id,@date_init,@date_end)
     

    #render :text => @valor.inspect 
    if valor.present?
       render json: { respuesta: valor, status: :ok }
       #EstimateSale.where(" date_init >= ? AND date_end <= ? AND farming_plot_id = ?",date_init, date_end,faming_plot)
    else
       @valor = TypeOfCrop.all
      render json: { respuesta: valor,status: :existe, msg:"Ya existe una estimación para este periodo y cultivo." }
    end
  end
  
  
  # GET /estimate_sales/new
  def new
    get_estimate_sale_params
    @history_sales = HistorySale.all
    @estimate_sale = EstimateSale.new
  end

  # GET /estimate_sales/1/edit
  def edit
    get_estimate_sale_params
    
  end

  # POST /estimate_sales
  # POST /estimate_sales.json
  def create
    get_estimate_sale_params
    @estimate_sale = EstimateSale.new(estimate_sale_params)

    respond_to do |format|
      if @estimate_sale.save
        # format.js
        flash[:notice] = "Fue guardado exitosamente!"
        format.html { redirect_to  action:"index"}
      else
        #format.js
        flash[:alert] = "Ha ocurrido un error al guardar!"
        format.html { redirect_to  action:"edit"}
      end
    end
  end

  # PATCH/PUT /estimate_sales/1
  # PATCH/PUT /estimate_sales/1.json
  def update
    get_estimate_sale_params
    
    respond_to do |format|
      if @estimate_sale.update(estimate_sale_params)
        flash[:notice] = "Fue guardado exitosamente!"
        format.html { redirect_to  action:"index"}
      else
        flash[:notice] = "Ha ocurrido un error al guardar!"
        format.html { redirect_to  action:"edit"}
      end
    end
  end

  # DELETE /estimate_sales/1
  # DELETE /estimate_sales/1.json
  def destroy
    @estimate_sale = EstimateSale.find(params[:id])
    respond_to do |format|
      if @estimate_sale.destroy        
        format.js
      else
        format.js
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_estimate_sale
    @estimate_sale = EstimateSale.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def estimate_sale_params
    params.require(:estimate_sale).permit(:code,:type_of_crop_id,:farming_plot_id,:chart_of_account_id, :estimate_production,:date_init,:date_end, :total_production, :price, :gross_sale)
  end
  def get_estimate_sale_params
    @farming_plots = FarmingPlot.all.collect {|p| [ p.name, p.id, {"data-area-parcela"=>p.area} ] }
    @charts = ChartOfAccount.all.collect {|type|[type.name, type.id]}
    @history_sales = HistorySale.all.collect {|type| [type.quantity, type.id, {"data-date"=>type.date} ] }
    #@type_of_crops = TypeOfCrop.all.collect {|p| [ p.name, p.id ] }

    # @farm = EstimateSale.farming_plot.find(:estimate_sale_farming_plot_id)
  end
end
