class UnitOfMeasurementsController < ApplicationController     	# GET /type_of_crops	# GET /type_of_crops.json	def index		#@unit_of_measurements = UnitOfMeasurement.all    	end	# GET /type_of_crops/1	# GET /type_of_crops/1.json	def show	end	# GET /type_of_crops/new	def new		@unit_of_measurement = UnitOfMeasurement.new	end	# GET /type_of_crops/1/edit	def edit		@unit_of_measurement = UnitOfMeasurement.find(params[:id]);		@name = @unit_of_measurement.name;		@abbreviation = @unit_of_measurement.abbreviation;		@coefficient = @unit_of_measurement.coefficient;	end	# POST /type_of_crops	# POST /type_of_crops.json	def create  		@name = params[:unit_of_measurement][:name];		@abbreviation = params[:unit_of_measurement][:abbreviation];		@coefficient = params[:unit_of_measurement][:coefficient];		#Creamos el objeto con los valores a ingresar.		@unit_of_measurement = UnitOfMeasurement.new({			:name => @name,			:abbreviation => @abbreviation,			:coefficient => @coefficient			});		if @unit_of_measurement.save			#format.html { redirect_to @product, notice: 'Supply was successfully created.' }			render json: { contenido: @unit_of_measurement, location: unit_of_measurement_url(@unit_of_measurement),result: :ok },status: 200		else			#format.html { render :new }			render json:  @unit_of_measurement.errors, status: :unprocessable_entity 		end   	end	# PATCH/PUT /type_of_crops/1	# PATCH/PUT /type_of_crops/1.json	def update		respond_to do |format|			if @brand.update(unit_of_measurement_params)				format.json { render json: @unit_of_measurement }			else				format.json { render json: @unit_of_measurement.errors, :status => :unprocessable_entity }			end		end	end	# DELETE /type_of_crops/1	# DELETE /type_of_crops/1.json	def destroy		@unit_of_measurement = UnitOfMeasurement.find(params[:id])		@unit_of_measurement.destroy		respond_to do |format|			flash[:notice] = "Successfull be destroyed"			format.html { redirect_to  action:"index"}		end	end	private		# Use callbacks to share common setup or constraints between actions.		def set_unit_of_measurement			@unit_of_measurement = UnitOfMeasurement.find(params[:id])		end		# Never trust parameters from the scary internet, only allow the white list through.		def unit_of_measurement_params			params.require(:unit_of_measurement).permit(:name, :abbreviation, :coefficient)		endend