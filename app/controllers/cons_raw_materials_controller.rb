class ConsRawMaterialsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cons_raw_material, only: [:show, :edit, :update, :destroy]
  
  # GET /cons_raw_materials
  # GET /cons_raw_materials.json
  def index
    @cons_raw_materials = ConsRawMaterial.all
  end

  # GET /cons_raw_materials/1
  # GET /cons_raw_materials/1.json
  def show
  end

  # GET /cons_raw_materials/new
  def new
    @cons_raw_material = ConsRawMaterial.new
    id_program_production = ProgramProduction.last
    plot = ProgramProduction.find(id_program_production).estimate_sale.farming_plot
    @area_plot = plot.area
    @program_production = id_program_production.id
    
    
   
    #1.times { @cons_raw_material.cons_raw_material_details.build }
  end

  # GET /cons_raw_materials/1/edit
  def edit
  end

  #agrega de forma manual los datos de consumo
  #p = ConsRawMaterial.new
  # p.program_production_id = 1
  #p.total = 496800
    
  #r = ConsRawMaterialDetail.new
  #r.cons_raw_material_id = 1
  #r.supply_id = 1
  #r.total_unit = 20.00  
  # r.subtotal = 496800
    
  #  p.save
  # r.save
  
  # POST /cons_raw_materials
  # POST /cons_raw_materials.json
  def create    
    @cons_raw_material = ConsRawMaterial.new(cons_raw_material_params)
    respond_to do |format|
      if @cons_raw_material.save
        format.html { redirect_to @cons_raw_material, notice: 'Farming plot was successfully created.' }
        format.json { render :show, status: :created, location: @cons_raw_material }
      else
        
        format.html { render :new }
        format.json { render json: @cons_raw_material.errors, status: :unprocessable_entity }
      end
    end
 
  end

  # PATCH/PUT /cons_raw_materials/1
  # PATCH/PUT /cons_raw_materials/1.json
  def update
    respond_to do |format|
      if @cons_raw_material.update(cons_raw_material_params)
        format.html { redirect_to @cons_raw_material, notice: 'Cons raw material was successfully updated.' }
        format.json { render :show, status: :ok, location: @cons_raw_material }
      else
        format.html { render :edit }
        format.json { render json: @cons_raw_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cons_raw_materials/1
  # DELETE /cons_raw_materials/1.json
  def destroy
    #mp = materia prima
    @cons_raw_material = ConsRawMaterial.find(params[:id])
    @mp = ConsRawMaterialDetail.where(cons_raw_material_id: @cons_raw_material.id)
    @mp.each do |book|
      book.destroy
    end
    @cons_raw_material.destroy
    respond_to do |format|
      format.html { redirect_to cons_raw_materials_url, notice: 'Cons raw material was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cons_raw_material
    @cons_raw_material = ConsRawMaterial.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cons_raw_material_params
    params.require(:cons_raw_material).permit(:program_production_id, :total,cons_raw_material_details_attributes: [:supply_id, :total_unit, :subtotal])
  end
end
