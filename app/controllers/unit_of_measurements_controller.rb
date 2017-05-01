class UnitOfMeasurementsController < ApplicationController
  before_action :set_unit_of_measurement, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /type_of_crops
  # GET /type_of_crops.json
  def index
    @unit_of_measurements = UnitOfMeasurement.all    
  end

  # GET /type_of_crops/1
  # GET /type_of_crops/1.json
  def show
    @unit_of_measurements = UnitOfMeasurement.find(params[:id])
    respond_to do |format|
      format.html { redirect_to  action:"index"}
      #format.json { render json: @types_crops}
    end
  end

  # GET /type_of_crops/new
  def new
    @unit_of_measurement = UnitOfMeasurement.new
    
  end

  # GET /type_of_crops/1/edit
  def edit
    @unit_of_measurement = UnitOfMeasurement.find(params[:id]);
    @name = @unit_of_measurement.name;
    @abbreviation = @unit_of_measurement.abbreviation;
    @coefficient = @unit_of_measurement.coefficient;
  end

  # POST /type_of_crops
  # POST /type_of_crops.json
  def create  
   
    @name = params[:unit_of_measurement][:name];
    @abbreviation = params[:unit_of_measurement][:abbreviation];
    @coefficient = params[:unit_of_measurement][:coefficient];
    #Creamos el objeto con los valores a ingresar.
    @unit_of_measurement = UnitOfMeasurement.new({
        :name => @name,
        :abbreviation => @abbreviation,
        :coefficient => @coefficient
      });
        
    respond_to do |format|
      if @unit_of_measurement.save
        flash[:notice] = "Unidad de medida creada con exito"
        format.html { redirect_to  action:"index"}
      else
        flash[:alert] = "Error al crear la unidad de medida"
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /type_of_crops/1
  # PATCH/PUT /type_of_crops/1.json
  def update
    @name = params[:unit_of_measurement]["name"];
    @abbreviation = params[:unit_of_measurement]["abbreviation"];
    @coefficient = params[:unit_of_measurement]["coefficient"];
   
    @unit_of_measurement = UnitOfMeasurement.find(params[:id]);
    @unit_of_measurement.code = @name;
    @unit_of_measurement.name = @abbreviation;
    @unit_of_measurement.variety = @coefficient
    respond_to do |format|
      if @unit_of_measurement.save
        format.html { redirect_to @unit_of_measurements, notice: 'Unidad de medida actualizada con exito.' }
        #format.json { render :show, status: :created, location: @stru_expense_det }
      else
        format.html { render :new }
        #format.json { render json: @type_of_crop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_of_crops/1
  # DELETE /type_of_crops/1.json
  def destroy
    @unit_of_measurement = UnitOfMeasurement.find(params[:id])
    @unit_of_measurement.destroy
    respond_to do |format|
      flash[:notice] = "Successfull be destroyed"
      format.html { redirect_to  action:"index"}
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
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
end
