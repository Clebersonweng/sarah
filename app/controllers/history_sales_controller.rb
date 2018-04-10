class HistorySalesController < ApplicationController
  before_action :set_history_sale, only: [:show, :edit, :update, :destroy]

  # GET /history_sales
  # GET /history_sales.json
  def index
    get_all
    @history_sales = HistorySale.all
  end

  # GET /history_sales/1
  # GET /history_sales/1.json
  def show
  end

  # GET /history_sales/new
  def new
    get_all
    @history_sale = HistorySale.new
  end

  # GET /history_sales/1/edit
  def edit
    get_all
  end

  # POST /history_sales
  # POST /history_sales.json
  def create
    @history_sale = HistorySale.new(history_sale_params)

    respond_to do |format|
      if @history_sale.save
        #format.html { redirect_to @history_sale, notice: 'History sale was successfully created.' }
        format.json { render :show, status: :created, location: @history_sale }
      else
        #format.html { render :new }
        format.json { render json: @history_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /history_sales/1
  # PATCH/PUT /history_sales/1.json
  def update
    respond_to do |format|
      if @history_sale.update(history_sale_params)
        #format.html { redirect_to @history_sale, notice: 'History sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @history_sale }
      else
        #format.html { render :edit }
        format.json { render json: @history_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /history_sales/1
  # DELETE /history_sales/1.json
  def destroy
    @history_sale.destroy
    respond_to do |format|
      if @history_sale.destroy
        format.js
      else
        format.js
      end
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_history_sale
      @history_sale = HistorySale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def history_sale_params
      params.require(:history_sale).permit(:period, :date, :quantity)
    end

    def get_all
      @path           = "/ catastros / parcela / histórico de producción"
      @edit_name      = "Editar histórico de producción"
    end

end
