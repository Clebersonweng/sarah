class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /supplies
  # GET /supplies.json
  def index
    get_all
    @products = Product.all
   
  end

  # GET /supplies/1
  # GET /supplies/1.json
  def show
  end

  # GET /supplies/new
  def new
    get_all
    @product = Product.new
  end

  # GET /supplies/1/edit
  def edit
    get_all
  end

  # POST /supplies
  # POST /supplies.json
  def create
    get_all
    @product = Product.new(product_params)
    if @product.save
      render json: { contenido: @product, location: product_url(@product),result: :ok },status: 200
    else
      render json:  @product.errors, status: :unprocessable_entity    
    end
  end

  # PATCH/PUT /supplies/1
  # PATCH/PUT /supplies/1.json
  def update
      respond_to do |format|
        if @product.update(product_params)
         format.json { render json: @products }
        else
          format.json { render json: @products.errors, :status => :unprocessable_entity }
        end
      end

  end

  # DELETE /supplies/1
  # DELETE /supplies/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    respond_to do |format|
      format.html { redirect_to product_url, notice: 'Fue eliminado exitosamente' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:maker, :unit_of_measurement_id, :tradename, :price, :dosage, :cost_per_hectare, :description)
  end
  def get_all
    @unit_of_measurements = UnitOfMeasurement.all.collect{|type| [type.name, type.id]}
    @path = "productos"
  end
end
