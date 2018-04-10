class ManPowersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_man_power, only: [:show, :edit, :update, :destroy]
	respond_to :html, :json

  # GET /man_powers
  # GET /man_powers.json
  def index
  	get_all
  	@man_powers = ManPower.all
  	
	 #Student.where(id: student_id).pluck('SUM(total_mark)', 'SUM(marks_obtained)')
	end

  # GET /man_powers/1
  # GET /man_powers/1.json
  def show

  end

  # GET /man_powers/new
  def new
  	get_all
  	@man_power = ManPower.new
  	program_production = ProgramProduction.last
  	@program_production_id = program_production.id
  	
	 #@mp = ConsRawMaterialDetail.where(cons_raw_material_id: @cons_raw_material.id)
	end

	# GET /man_powers/1/edit
	def edit
		get_all
		man_power               = ManPower.find(params[:id])
		@man_powers_details     = ManPowerDetail.where(man_power_id: man_power.id)
		@program_production_id  = man_power.program_production_id
		@total_hours_needed     = man_power.total_hours_needed
		@total                  = @man_powers_details.sum(:subtotal)
		
		#render :json => {:data => @man_powers_details}
	end

  # POST /man_powers
  # POST /man_powers.json
  def create
  	get_all
  	@man_power = ManPower.new(man_power_params)

	 #respond_to do |format|
	 if @man_power.save
		  #format.html { redirect_to @man_power, notice: 'Man power was successfully created.' }
		  #redirect_to man_power_path(@man_power, format: :json)
		  render json: { contenido: @man_power, location: man_power_url(@man_power),result: :ok },status: 200
		else
		  #format.html { render :new }
		  render json:  @man_power.errors, status: :unprocessable_entity 
		end
	 #end
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
	 	params.require(:man_power).permit(:program_production_id, :total_hours_needed, :total,man_power_details_attributes: [:type_of_work_id,:hours_needed, :person_id, :subtotal])
	 end
	 def get_all
	 	@employee 			= Person.all.collect { |type|[type.name, type.id]}
	 	@type_of_work 		= TypeOfWork.all.collect{ |type|[type.name, type.id,{"data-salary"=> type.price_hours }]}
	 	@path 				= " / crear estimación / mano de obra"
	    @edit_name     	= "Editar mano de obra"
	 end

	end
