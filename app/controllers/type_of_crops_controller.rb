class TypeOfCropsController < ApplicationController
  before_action :set_type_of_crop, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  
  # GET /type_of_crops
  # GET /type_of_crops.json
  def index
    get_all
    @type_of_crops = TypeOfCrop.all
    @type_of_crops.as_json(only: [:id, :code, :name, :variety_id,:"['variety']['descr']"],:include => { :variety => { :only => :descr }})

    respond_with(@type_of_crops)
  end

  # GET /type_of_crops/1
  # GET /type_of_crops/1.json
  def show
    @types_crops = TypeOfCrop.find(params[:id])
    respond_to do |format|
      format.html { redirect_to  action:"index"}
      #format.json { render json: @types_crops}
    end
  end

  # GET /type_of_crops/new
  def new
    get_all
    @type_of_crop = TypeOfCrop.new
    
  end

  # GET /type_of_crops/1/edit
  def edit
    get_all
  end

  # POST /type_of_crops
  # POST /type_of_crops.json
  def create  
    get_all 
    @type_of_crop = TypeOfCrop.new(type_of_crop_params)

    if @type_of_crop.save
      #format.html { redirect_to @product, notice: 'Supply was successfully created.' }
      render json: { contenido: @type_of_crop, location: type_of_crop_url(@type_of_crop),result: :ok },status: 200
    else
      #format.html { render :new }
      render json:  @type_of_crop.errors, status: :unprocessable_entity 
      
    end
  end

  # PATCH/PUT /type_of_crops/1
  # PATCH/PUT /type_of_crops/1.json
  def update
    get_all #traer todos los campos

    if @type_of_crop.update(type_of_crop_params)
      render json: { contenido: @type_of_crop, location: type_of_crop_url(@type_of_crop),result: :ok },status: 200
    else
      render json:  @type_of_crop.errors, status: :unprocessable_entity   
    end
  end
  
  # DELETE /type_of_crops/1
  # DELETE /type_of_crops/1.json
  def destroy
    @type_of_crop = TypeOfCrop.find(params[:id]) 
    
    respond_to do |format|
      if @type_of_crop.destroy
        format.js
      else
        format.js
      end
    end  
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_type_of_crop
    @type_of_crop = TypeOfCrop.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def type_of_crop_params
    params.require(:type_of_crop).permit(:code, :name, :variety_id)
  end

  def get_all
    @varieties = Variety.all.collect {|p| [ p.descr, p.id ] }
    @path = "tipo de cultivo"

  end
end
