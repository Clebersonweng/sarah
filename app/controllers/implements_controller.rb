class ImplementsController < ApplicationController
  before_action :set_implement, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /implements
  # GET /implements.json
  def index
    @implements = Implement.all
  end

  # GET /implements/1
  # GET /implements/1.json
  def show
  end

  # GET /implements/new
  def new
    get_params_implements
    @implement = Implement.new
  end

  # GET /implements/1/edit
  def edit
    get_params_implements
  end

  # POST /implements
  # POST /implements.json
  def create
    get_params_implements
    @implement = Implement.new(implement_params)

    respond_to do |format|
      if @implement.save
        format.html { redirect_to @implement, notice: 'Implement was successfully created.' }
        format.json { render :show, status: :created, location: @implement }
      else
        format.html { render :new }
        format.json { render json: @implement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /implements/1
  # PATCH/PUT /implements/1.json
  def update
    get_params_implements
    respond_to do |format|
      if @implement.update(implement_params)
        format.html { redirect_to @implement, notice: 'Implement was successfully updated.' }
        format.json { render :show, status: :ok, location: @implement }
      else
        format.html { render :edit }
        format.json { render json: @implement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /implements/1
  # DELETE /implements/1.json
  def destroy
    get_params_implements
    @implement = Implement.find(params[:id])
    @implement.destroy
    respond_to do |format|
      format.html { redirect_to implements_url, notice: 'Implement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_implement
      @implement = Implement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def implement_params
      params.require(:implement).permit(:name, :model, :oper_time, :machine_id, :coef_cccr, :year, :brand, :price)
    end
    def get_params_implements
      @machines = Machine.all.collect {|type| [type.model.name, type.id]}
    end
end
