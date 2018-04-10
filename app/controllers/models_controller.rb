class ModelsController < ApplicationController
  before_action :set_model, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  def index
    get_all
    @models = Model.all
    respond_with(@models)

  end


  def show
    @models = Model.find(params[:id])
    respond_to do |format|
      format.html { redirect_to  action:"index"}
      #format.json { render json: @types_crops}
    end
  end


  def new
    get_all
    @model = Model.new
    
  end


  def edit
    get_all
  end

  def create 
    get_all  
    @model = Model.new(model_params)

    if @model.save
      #format.html { redirect_to @product, notice: 'Supply was successfully created.' }
      render json: { contenido: @model, location: model_url(@model),result: :ok },status: 200
    else
      #format.html { render :new }
      render json:  @model.errors, status: :unprocessable_entity 
      
    end
  end

  def update
      respond_to do |format|
        if @model.update(model_params)
         format.json { render json: @model }
        else
          format.json { render json: @models.errors, :status => :unprocessable_entity }
        end
      end

  end

  
  

def check_rel(_id)
  exist_relation = Machine.where(:model_id => _id)
    return true if exist_relation.count == 0
  false
end

  def destroy
    @model        = Model.find(params[:id]) 
    if check_rel(params[:id]) 
        respond_to do |format|
            if @model.destroy
              format.js
            else
              render json: { contenido: @model, location: model_url(@model),message: :"no puede ser eliminado" },status: 400
            end
        end  
    else
      render json:  @model.errors, status: :bad_request 
    end

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_model
    @model = Model.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def model_params
    params.require(:model).permit(:name,:brand_id, :description)
  end
  
  def get_all
    @brands = Brand.all.collect {|p| [ p.name, p.id ] }
    @path = "/ catastros / máquinas & implementos / modelos"
    @edit_name      = "Editar modelo"
  end
end
