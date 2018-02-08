class ImplementsController < ApplicationController
  before_action :set_implement, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  # GET /implements
  # GET /implements.json
  def index
    get_all
    @implements = Implement.all
  end


  def show
    @implements = Implement.find(params[:id])
    respond_to do |format|
      format.html { redirect_to  action:"index"}
      #format.json { render json: @types_crops}
    end
  end


  def new
    get_all
    @implement = Implement.new
    
  end


  def edit
   get_all
  end

  def create 
    get_all  
    @implement = Implement.new(implement_params)

    if @implement.save
      #format.html { redirect_to @product, notice: 'Supply was successfully created.' }
      render json: { contenido: @implement, location: implement_url(@implement),result: :ok },status: 200
    else
      #format.html { render :new }
      render json:  @implement.errors, status: :unprocessable_entity 
      
    end
  end

  def update
    get_all
    if @implement.update(implement_params)
      render json: { contenido: @implement, location: implement_url(@implement),result: :ok },status: 200
    else
      render json:  @implement.errors, status: :unprocessable_entity   
    end
  end

  def check_rel(_id)
    exist_relation = Implement.where(:machine_id => _id)
      return true if exist_relation.count == 0
    false
  end
  
  def destroy
    @implement        = Implement.find(params[:id]) 
    if check_rel(@implement.machine_id) 
        respond_to do |format|
            if @implement.destroy
              format.js
            else
              render json: { contenido: @implement, location: implement_url(@implement),message: :"no puede ser eliminado" },status: 400
            end
        end  
    else
      render json:  @implement.errors, status: :bad_request 
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_implement
      @implement = Implement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def implement_params
      params.require(:implement).permit(:name,:brand, :model, :oper_time, :machine_id, :coef_cccr, :year, :price)
    end

    def get_all
      @machines = Machine.all.collect {|type| [type.model.name, type.id]}
      @path = "/ catastros / máquinas & implementos / implementos"
    end
end
