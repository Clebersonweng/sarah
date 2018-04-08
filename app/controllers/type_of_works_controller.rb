class TypeOfWorksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_type_of_work, only: [:show, :edit, :update, :destroy]

  # GET /type_of_works
  # GET /type_of_works.json
  def index
    get_all
    @type_of_works = TypeOfWork.all
  end

  # GET /type_of_works/1
  # GET /type_of_works/1.json
  def show
  end

  # GET /type_of_works/new
  def new
    get_all
    @type_of_work = TypeOfWork.new
  end

  # GET /type_of_works/1/edit
  def edit
    get_all
  end

  # POST /type_of_works
  # POST /type_of_works.json
  def create
    @type_of_work = TypeOfWork.new(type_of_work_params)

    respond_to do |format|
      if @type_of_work.save
        #format.html { redirect_to @type_of_work, notice: 'Type of work was successfully created.' }
        format.json { render :show, status: :created, location: @type_of_work }
      else
        format.html { render :new }
        format.json { render json: @type_of_work.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_of_works/1
  # PATCH/PUT /type_of_works/1.json
  def update
    respond_to do |format|
      if @type_of_work.update(type_of_work_params)
        #format.html { redirect_to @type_of_work, notice: 'Type of work was successfully updated.' }
        format.json { render :show, status: :ok, location: @type_of_work }
      else
        format.html { render :edit }
        format.json { render json: @type_of_work.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_of_works/1
  # DELETE /type_of_works/1.json
  def check_rel(_id)
    exist_relation = ManPowerDetail.where(:type_of_work_id => _id)
    return true if exist_relation.count == 0
    false
  end

  def destroy
    @type_of_work        = TypeOfWork.find(params[:id]) 
    if check_rel(params[:id]) 
        respond_to do |format|
            if @type_of_work.destroy
              format.js
            else
              render json: { contenido: @type_of_work, location: type_of_work_url(@type_of_work),message: :"no puede ser eliminado" },status: 400
            end
        end  
    else
      render json:  @type_of_work.errors, status: :bad_request 
    end

  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_type_of_work
    @type_of_work = TypeOfWork.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def type_of_work_params
    params.require(:type_of_work).permit(:name, :price_hours, :description)
  end
  def get_all
    @path = "/ catastros / tipos / tipo de trabajo"
  end
end
