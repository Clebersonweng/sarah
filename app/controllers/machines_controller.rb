class MachinesController < ApplicationController
  before_action :set_machine, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /machines
  # GET /machines.json
  def index
    get_all
    @machines = Machine.all
  end

  # GET /machines/1
  # GET /machines/1.json
  def show
  end

  # GET /machines/new
  def new
    get_all
    @machine = Machine.new
  end

  # GET /machines/1/edit
  def edit
    get_all
  end

  # POST /machines
  # POST /machines.json
  def create
    get_all
    @machine = Machine.new(machine_params)

    if @machine.save
      #format.html { redirect_to @product, notice: 'Supply was successfully created.' }
      render json: { contenido: @successfully, location: machine_url(@machine),result: :ok },status: 200
    else
      #format.html { render :new }
      render json:  @machine.errors, status: :unprocessable_entity 
      
    end
  end

  # PATCH/PUT /machines/1
  # PATCH/PUT /machines/1.json
  def update
      respond_to do |format|
        if @machine.update(machine_params)
         format.json { render json: @machine }
        else
          format.json { render json: @machines.errors, :status => :unprocessable_entity }
        end
      end

  end

  # DELETE /machines/1
  # DELETE /machines/1.json
  def check_rel(_id)
    exist_relation = Implement.where(:machine_id => _id)
      return true if exist_relation.count == 0
    false
  end
  
  def destroy
    @machine        = Machine.find(params[:id]) 
    if check_rel(@implement.machine_id) 
        respond_to do |format|
            if @machine.destroy
              format.js
            else
              render json: { contenido: @machine, location: implement_url(@machine),message: :"no puede ser eliminado" },status: 400
            end
        end  
    else
      render json:  @machine.errors, status: :bad_request 
    end

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_machine
    @machine = Machine.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def machine_params
    params.require(:machine).permit(:name, :brand_id, :model_id, :hp, :consumption, :price, :year_purchase, :coeficient_cccr, :time_oper, :fuel_id, :type_machine_id,:working_capacity,:working_capacity_effective)
  end
  
  def get_all
    @title = "Consumo"
    @type_machines = TypeMachine.all.collect {|c| [c.description, c.id] }
    @brands = Brand.all.collect {|c| [c.name, c.id] }
    @models = Model.all.collect {|type|[type.name, type.id]}
    @fuels  = Fuel.all.collect {|p| [p.name, p.id, {"data-price"=>p.price}]}
    @path   = "/ catastros / máquinas & implementos / maquinárias"
  end
end
