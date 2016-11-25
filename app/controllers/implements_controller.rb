class ImplementsController < ApplicationController
  before_action :set_implement, only: [:show, :edit, :update, :destroy]

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
    @implement = Implement.new
  end

  # GET /implements/1/edit
  def edit
  end

  # POST /implements
  # POST /implements.json
  def create
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
      params.require(:implement).permit(:name, :model, :oper_time, :machine_id, :coef_cccr)
    end
end
