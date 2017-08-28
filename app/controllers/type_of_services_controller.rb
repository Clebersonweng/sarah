class TypeOfServicesController < ApplicationController
  before_action :set_type_of_service, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /type_of_services
  # GET /type_of_services.json
  def index
    @type_of_services = TypeOfService.all
  end

  # GET /type_of_services/1
  # GET /type_of_services/1.json
  def show
  end

  # GET /type_of_services/new
  def new
    get_type_service_params
    @type_of_service = TypeOfService.new
  end

  # GET /type_of_services/1/edit
  def edit
    get_type_service_params
  end

  # POST /type_of_services
  # POST /type_of_services.json
  def create
    @type_of_service = TypeOfService.new(type_of_service_params)

    respond_to do |format|
      if @type_of_service.save
        format.html { redirect_to @type_of_service, notice: 'Type of service was successfully created.' }
        format.json { render :show, status: :created, location: @type_of_service }
      else
        format.html { render :new }
        format.json { render json: @type_of_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_of_services/1
  # PATCH/PUT /type_of_services/1.json
  def update
    respond_to do |format|
      if @type_of_service.update(type_of_service_params)
        format.html { redirect_to @type_of_service, notice: 'Type of service was successfully updated.' }
        format.json { render :show, status: :ok, location: @type_of_service }
      else
        format.html { render :edit }
        format.json { render json: @type_of_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_of_services/1
  # DELETE /type_of_services/1.json
  def destroy
    @type_of_service.destroy
    respond_to do |format|
      format.html { redirect_to type_of_services_url, notice: 'Type of service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_of_service
      @type_of_service = TypeOfService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_of_service_params
      params.require(:type_of_service).permit(:name, :price, :unit_of_measurement_id, :description)
    end
    def get_type_service_params
      @unit_measurements = UnitOfMeasurement.all.collect { |p| [ p.name, p.id ] }
    end
    
end
