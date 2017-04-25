class ManPowersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_man_power, only: [:show, :edit, :update, :destroy]

  # GET /man_powers
  # GET /man_powers.json
  def index
    @man_powers = ManPower.all
  end

  # GET /man_powers/1
  # GET /man_powers/1.json
  def show
  end

  # GET /man_powers/new
  def new
    get_variables
    @man_power = ManPower.new
    id_prog_p = ProgramProduction.last
    @prog_production = id_prog_p
    
    #@mp = ConsRawMaterialDetail.where(cons_raw_material_id: @cons_raw_material.id)
  end

  # GET /man_powers/1/edit
  def edit
    get_variables
  end

  # POST /man_powers
  # POST /man_powers.json
  def create
    get_variables
    @man_power = ManPower.new(man_power_params)

    respond_to do |format|
      if @man_power.save
        format.html { redirect_to @man_power, notice: 'Man power was successfully created.' }
        format.json { render :show, status: :created, location: @man_power }
      else
        format.html { render :new }
        format.json { render json: @man_power.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /man_powers/1
  # PATCH/PUT /man_powers/1.json
  def update
    respond_to do |format|
      if @man_power.update(man_power_params)
        format.html { redirect_to @man_power, notice: 'Man power was successfully updated.' }
        format.json { render :show, status: :ok, location: @man_power }
      else
        format.html { render :edit }
        format.json { render json: @man_power.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /man_powers/1
  # DELETE /man_powers/1.json
  def destroy
     #mp = materia prima
    @man_power = ManPower.find(params[:id])
    @mp_detail = ConsRawMaterialDetail.where(man_power_id: @man_power.id)
    @mp_detail.each do |detail|
      detail.destroy
    end
    @man_power.destroy
    respond_to do |format|
      format.html { redirect_to man_powers_url, notice: 'Man power was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_man_power
      @man_power = ManPower.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def man_power_params
      params.require(:man_power).permit(:program_production_id, :total_hours_needed, :total,man_power_details_attributes: [:type_of_work_id,:hours_needed, :people_id, :subtotal])
    end
    def get_variables
      @employee = Person.all.collect{ |type|[type.name, type.id]}
      @type_of_work = TypeOfWork.all.collect{ |type|[type.name, type.id]}
    end
end
