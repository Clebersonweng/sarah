class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /supplies
  # GET /supplies.json
  def index
    @products = Product.all
   
  end

  # GET /supplies/1
  # GET /supplies/1.json
  def show
  end

  # GET /supplies/new
  def new
    @product = Product.new
    @unit_of_measurement = UnitOfMeasurement.all.collect{|type| [type.name, type.id]}
  end

  # GET /supplies/1/edit
  def edit
  end

  # POST /supplies
  # POST /supplies.json
  def create
    @product = Product.new(supply_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Supply was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supplies/1
  # PATCH/PUT /supplies/1.json
  def update
    respond_to do |format|
      if @product.update(supply_params)
        format.html { redirect_to @product, notice: 'Supply was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supplies/1
  # DELETE /supplies/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    respond_to do |format|
      format.html { redirect_to supplies_url, notice: 'Supply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def supply_params
    params.require(:product).permit(:maker, :unit_of_measurement_id, :tradename, :price, :dosage, :cost_per_hectare, :description)
  end
end
