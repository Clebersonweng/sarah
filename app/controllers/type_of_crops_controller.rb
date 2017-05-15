class TypeOfCropsController < ApplicationController
  before_action :set_type_of_crop, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  
  # GET /type_of_crops
  # GET /type_of_crops.json
  def index
    @type_of_crops = TypeOfCrop.all
    @controller_name = "Tipo de cultivo" 
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
    @type_of_crop = TypeOfCrop.new
    
  end

  # GET /type_of_crops/1/edit
  def edit
    @type_of_crop = TypeOfCrop.find(params[:id]);
    @code = @type_of_crop.code;
    @name = @type_of_crop.name;
    @variety = @type_of_crop.variety;
  end

  # POST /type_of_crops
  # POST /type_of_crops.json
  def create   
    @type_of_crop = TypeOfCrop.new(type_of_crop_params)

    respond_to do |format|
      if @type_of_crop.save
        format.html { redirect_to @type_of_crop, notice: 'Fue guardado exitosamente.' }
        format.json { render :show, status: :created, location: @type_of_crop }
      else
        format.html { render :new }
        format.json { render json: @implement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_of_crops/1
  # PATCH/PUT /type_of_crops/1.json
  def update
    @code = params[:type_of_crop]["code"];
    @name = params[:type_of_crop]["name"];
    @variety = params[:type_of_crop]["variety"];
   
    @type_of_crop = TypeOfCrop.find(params[:id]);
    @type_of_crop.code = @code;
    @type_of_crop.name = @name;
    @type_of_crop.variety = @variety
    respond_to do |format|
      if @type_of_crop.save
        flash[:notice] = "Se guardo exitosamente."
        format.html { redirect_to  action:"index"}
      else
        flash[:alert] = "Ocurrio un error al guardar"
        format.html { redirect_to  action:"edit"}
      end
    end
  end
  
  # DELETE /type_of_crops/1
  # DELETE /type_of_crops/1.json
  def destroy
    @type_of_crop = TypeOfCrop.find(params[:id]) 
    
    respond_to do |format|
      if @type_of_crop.destroy
        #format.html { redirect_to @type_of_crop, notice: 'Se actualizo exitosamente!' }        
        res = 1
        format.json  { render :json => res }
        #format.json { status: :created, location: @type_of_crop }
      else
        res = 0
        format.json  { render :json => res }
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
    params.require(:type_of_crop).permit(:code, :name, :variety)
  end
end
