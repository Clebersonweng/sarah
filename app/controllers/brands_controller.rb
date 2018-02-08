class BrandsController < ApplicationController
  before_action :set_brand, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /brands
  # GET /brands.json
  def index
    get_all
    @brands = Brand.all
  end


  def show
    @types_crops = Brand.find(params[:id])
    respond_to do |format|
      format.html { redirect_to  action:"index"}
      #format.json { render json: @types_crops}
    end
  end


  def new
    get_all
    @brand = Brand.new
    
  end


  def edit
    get_all
  end

  def create   
    @brand = Brand.new(brand_params)

    if @brand.save
      #format.html { redirect_to @product, notice: 'Supply was successfully created.' }
      render json: { contenido: @brand, location: brand_url(@brand),result: :ok },status: 200
    else
      #format.html { render :new }
      render json:  @brand.errors, status: :unprocessable_entity 
      
    end
  end

  def update
      respond_to do |format|
        if @brand.update(product_params)
         format.json { render json: @brand }
        else
          format.json { render json: @brands.errors, :status => :unprocessable_entity }
        end
      end

  end
  

  def check_rel(_id)
    exist_relation = Model.where(:brand_id => _id)
    return true if exist_relation.count == 0
    false
  end

  def destroy
    @brand        = Brand.find(params[:id]) 
    if check_rel(params[:id]) 
        respond_to do |format|
            if @brand.destroy
              format.js
            else
              render json: { contenido: @brand, location: brand_url(@brand),message: :"no puede ser eliminado" },status: 400
            end
        end  
    else
      render json:  @brand.errors, status: :bad_request 
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
  
  def get_all
    @path = " / catastros / máquinas & implementos / marcas"
  end

end
