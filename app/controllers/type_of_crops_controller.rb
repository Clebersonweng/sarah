class TypeOfCropsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_type_of_crop, only: [:show, :edit, :update, :destroy]

  # GET /type_of_crops
  # GET /type_of_crops.json
  def index
    @type_of_crops = TypeOfCrop.all
    respond_to do |format|
      format.html
      format.json { render :json => @type_of_crops}
    end
  end

  # GET /type_of_crops/1
  # GET /type_of_crops/1.json
  def show
    @supplies = TypeOfCrop.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @supplies}
    end
  end

  # GET /type_of_crops/new
  def new
    @type_of_crop = TypeOfCrop.new
    
  end

  # GET /type_of_crops/1/edit
  def edit
  end

  # POST /type_of_crops
  # POST /type_of_crops.json
  def create
    @type_of_crop = TypeOfCrop.new(type_of_crop_params)

    respond_to do |format|
      if @type_of_crop.save
        flash[:notice] = "Successfull be create"
        format.html { redirect_to  action:"index"}
      else
        flash[:alert] = "Unsuccessfull be create"
      end
    end
  end

  # PATCH/PUT /type_of_crops/1
  # PATCH/PUT /type_of_crops/1.json
  def update
    respond_to do |format|
      if @type_of_crop.update(type_of_crop_params)       
        flash[:notice] = "Successfull be create"
        format.html { redirect_to  action:"index"}
      else
        flash[:alert] = "Error unsuccessful be create"
        format.html { redirect_to  action:"index"}
      end
    end
  end

  # DELETE /type_of_crops/1
  # DELETE /type_of_crops/1.json
  def destroy
    @type_of_crop = TypeOfCrop.find(params[:id])
    @type_of_crop.destroy
    respond_to do |format|
      flash[:notice] = "Successfull be destroyed"
      format.html { redirect_to  action:"index"}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_type_of_crop
    @type_of_crop = TypeOfCrop.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def type_of_crop_params
    params.require(:type_of_crop).permit(:code, :name, :variety)
  end
end
