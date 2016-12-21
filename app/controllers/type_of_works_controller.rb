class TypeOfWorksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_type_of_work, only: [:show, :edit, :update, :destroy]

  # GET /type_of_works
  # GET /type_of_works.json
  def index
    @type_of_works = TypeOfWork.all
  end

  # GET /type_of_works/1
  # GET /type_of_works/1.json
  def show
  end

  # GET /type_of_works/new
  def new
    @type_of_work = TypeOfWork.new
  end

  # GET /type_of_works/1/edit
  def edit
  end

  # POST /type_of_works
  # POST /type_of_works.json
  def create
    @type_of_work = TypeOfWork.new(type_of_work_params)

    respond_to do |format|
      if @type_of_work.save
        format.html { redirect_to @type_of_work, notice: 'Type of work was successfully created.' }
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
        format.html { redirect_to @type_of_work, notice: 'Type of work was successfully updated.' }
        format.json { render :show, status: :ok, location: @type_of_work }
      else
        format.html { render :edit }
        format.json { render json: @type_of_work.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_of_works/1
  # DELETE /type_of_works/1.json
  def destroy
    @type_of_work.destroy
    respond_to do |format|
      format.html { redirect_to type_of_works_url, notice: 'Type of work was successfully destroyed.' }
      format.json { head :no_content }
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
end
