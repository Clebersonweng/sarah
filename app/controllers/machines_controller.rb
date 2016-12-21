class MachinesController < ApplicationController
  before_action :set_machine, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /machines
  # GET /machines.json
  def index
    @machines = Machine.all
  end

  # GET /machines/1
  # GET /machines/1.json
  def show
  end

  # GET /machines/new
  def new
    get_machine_params
    @machine = Machine.new
  end

  # GET /machines/1/edit
  def edit
    get_machine_params
  end

  # POST /machines
  # POST /machines.json
  def create
    get_machine_params
    @machine = Machine.new(machine_params)

    respond_to do |format|
      if @machine.save
        format.html { redirect_to @machine, notice: 'Machine was successfully created.' }
        format.json { render :show, status: :created, location: @machine }
      else
        format.html { render :new }
        format.json { render json: @machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /machines/1
  # PATCH/PUT /machines/1.json
  def update
    get_machine_params
    respond_to do |format|
      if @machine.update(machine_params)
        flash[:notice] = "Successfull be update"
        format.html { redirect_to  action:"index"}
      else
        format.html { render :edit }
        format.json { render json: @machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /machines/1
  # DELETE /machines/1.json
  def destroy
    @machine.destroy
    respond_to do |format|
      format.html { redirect_to machines_url, notice: 'Machine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_machine
    get_machine_params
    @machine = Machine.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def machine_params
    params.require(:machine).permit(:name, :brand_id, :model_id, :hp, :consumption, :price, :year_purchase, :coeficient_cccr, :time_oper, :fuel_id)
  end
  def get_machine_params
    @brands = Brand.all.collect {|c| [c.name, c.id] }
    @models = Model.all.collect {|type|[type.name, type.id]}
    @fuels = Fuel.all.collect {|p| [p.name, p.id, {"data-price"=>p.price}]}
  end
end
