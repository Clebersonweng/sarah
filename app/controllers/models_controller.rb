class ModelsController < ApplicationController
  before_action :set_model, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /models
  # GET /models.json
  def index
    @models = Model.all
  end

  # GET /models/1
  # GET /models/1.json
  def show
  end

  # GET /models/new
  def new
    get_params_model
    @model = Model.new
  end

  # GET /models/1/edit
  def edit
    get_params_model
  end

  # POST /models
  # POST /models.json
  def create
    get_params_model
    @model = Model.new(model_params)

    respond_to do |format|
      if @model.save
        format.json { redirect_to  action:"index", status: :created, location: @model }
      else
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /models/1
  # PATCH/PUT /models/1.json
  def update
    get_params_model
     if @model.update(farming_plot_params)
      render json: { contenido: @model, location: farming_plot_url(@model),result: :ok },status: 200
    else
      render json:  @model.errors, status: :unprocessable_entity   
    end
  end

  # DELETE /models/1
  # DELETE /models/1.json
  def destroy
    get_params_model
    @model = TypeOfCrop.find(params[:id]) 
    
    respond_to do |format|
      if @model.destroy
        format.js
      else
        format.js
      end
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
  
  def get_params_model
    @brands = Brand.all.collect{|type| [type.name, type.id]}
  end
end
