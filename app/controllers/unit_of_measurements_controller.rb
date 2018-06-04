class UnitOfMeasurementsController < ApplicationController
  before_action :set_unit_of_measurement, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /type_of_crops
  # GET /type_of_crops.json
  def index
   get_all
    @unit_of_measurements = UnitOfMeasurement.all    
  end

  # GET /type_of_crops/1
  # GET /type_of_crops/1.json
  def show
    
  end

  # GET /type_of_crops/new
  def new
   get_all
    @unit_of_measurement = UnitOfMeasurement.new
    
  end

  # GET /type_of_crops/1/edit
  def edit
   get_all
    @unit_of_measurement = UnitOfMeasurement.find(params[:id]);
    @name = @unit_of_measurement.name;
    @abbreviation = @unit_of_measurement.abbreviation;
    @coefficient = @unit_of_measurement.coefficient;
  end

  # POST /type_of_crops
  # POST /type_of_crops.json
  def create  
   
    #get_all
      @unit_of_measurement = UnitOfMeasurement.new(unit_of_measurement_params)
      if @unit_of_measurement.save
         render :json => {:contenido => @unit_of_measurement,:result => "ok"}
      else
         render json:  @unit_of_measurement.errors ,:data =>@unit_of_measurement.errors, status: :unprocessable_entity  
      end
  end

  # PATCH/PUT /type_of_crops/1
  # PATCH/PUT /type_of_crops/1.json
  def update
    if @unit_of_measurement.update(unit_of_measurement_params)
         render json: { contenido: @unit_of_measurement, location: unit_of_measurement_url(@unit_of_measurement),result: :ok },status: 200
      else
         render json:  @unit_of_measurement.errors, status: :unprocessable_entity 
      end
  end

  # DELETE /type_of_crops/1
  # DELETE /type_of_crops/1.json
   def check_rel(_id)
      exist_relation = Product.where(:unit_of_measurement_id => _id)
      return true if exist_relation.count == 0
       false
   end

   def destroy
      @unit_of_measurement        = UnitOfMeasurement.find(params[:id]) 
      if check_rel(params[:id]) 
         respond_to do |format|
            if @unit_of_measurement.destroy
               format.json { head :no_content }
               else
               render json: { contenido: @unit_of_measurement, location: unit_of_measurement_url(@unit_of_measurement),message: :"no puede ser eliminado" },status: 400
            end
         end  
         else
         render json:  @unit_of_measurement.errors, status: :bad_request 
      end

   end


  private
  # Use callbacks to share common setup or constraints between actions.
   def set_unit_of_measurement
      @unit_of_measurement = UnitOfMeasurement.find(params[:id])
   end

  # Never trust parameters from the scary internet, only allow the white list through.
   def unit_of_measurement_params
      params.require(:unit_of_measurement).permit(:name, :abbreviation, :coefficient)
   end

   def get_all
         @path           = "/ catastros / parcela / unidad de medida"
         @edit_name      = "Editar unidad de medida"
   end
end
