class BrandsController < ApplicationController
  before_action :set_brand, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /brands
  # GET /brands.json
  def index
    @brands = Brand.all
  end

  # GET /brands/1
  # GET /brands/1.json
  def show
  end

  # GET /brands/new
  def new
    @brand = Brand.new
  end

  # GET /brands/1/edit
  def edit
    @brand = Brand.find(params[:id]);
    @name = @brand.name
    @description = @brand.description
  end

  # POST /brands
  # POST /brands.json
  def create
    @brand = Brand.new(brand_params)

    if @brand.save
      #format.html { redirect_to @product, notice: 'Supply was successfully created.' }
      render json: { contenido: @brand, location: brand_url(@brands),result: :ok },status: 200
    else
      #format.html { render :new }
      render json:  @brand.errors, status: :unprocessable_entity 
      
    end
  end

  # PATCH/PUT /brands/1
  # PATCH/PUT /brands/1.json
  def update
    @name = params[:brand]["name"];
    @description = params[:brand]["description"];
   
    @brand = Brand.find(params[:id]);
    @brand.name = @name
    @brand.description = @description
    
    if @brand.save
      render json: { contenido: @brand,location: "window.location.pathname='#{brands_path}'",result: :ok },status: 200
    else
      render json:  @brand.errors, status: :unprocessable_entity 
    end
  end

  # DELETE /brands/1
  # DELETE /brands/1.json
  def destroy
    @brand = Brand.find(params[:id]) 
    
    respond_to do |format|
      if @brand.destroy
        format.js
      else
        format.js
      end
    end 
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_brand
    @brand = Brand.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def brand_params
    params.require(:brand).permit(:name, :description)
  end
end
