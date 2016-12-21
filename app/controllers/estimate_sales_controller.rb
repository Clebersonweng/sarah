class EstimateSalesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_estimate_sale, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  # GET /estimate_sales
  # GET /estimate_sales.json
  def index
    @estimate_sales = EstimateSale.all
    #@estimate_sales = EstimateSale.all 
    #respond_to do |format|
    # format.html # index.html.erb
    # format.json { render json: @estimate_sales }
    # end
  end

  # GET /estimate_sales/1
  # GET /estimate_sales/1.json
  def show
  end

  # GET /estimate_sales/new
  def new
    get_estimate_sale_params
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
        flash[:notice] = "Successfull be create"
        format.html { redirect_to  action:"index"}
      else
        flash[:alert] = "Unsuccessfull be create"
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
        flash[:notice] = "Successfull be update"
        format.html { redirect_to  action:"index"}
      else
        flash[:notice] = "Unsuccessfull be create"
        format.html { redirect_to  action:"edit"}
      end
    end
  end

  # DELETE /estimate_sales/1
  # DELETE /estimate_sales/1.json
  def destroy
    @estimate_sale = EstimateSale.find(params[:id])
    @estimate_sale.destroy
    respond_to do |format|
      flash[:notice] = "Successfull be destroyed"
      format.html { redirect_to  action:"index"}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_estimate_sale
    @estimate_sale = EstimateSale.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def estimate_sale_params
    params.require(:estimate_sale).permit(:farming_plot_id, :estimate_production, :total_production, :price, :gross_sale)
  end
  def get_estimate_sale_params
    @farming_plots = FarmingPlot.all.collect {|p| [ p.name, p.id, {"data-area-parcela"=>p.area} ] }
  end
end
