class StruExpenseDetsController < ApplicationController
  before_action :set_stru_expense_det, only: [:show, :edit, :update, :destroy]

  # GET /stru_expense_dets
  # GET /stru_expense_dets.json
  def index
    @stru_expense_dets = StruExpenseDet.all
  end

  # GET /stru_expense_dets/1
  # GET /stru_expense_dets/1.json
  def show
  end

  # GET /stru_expense_dets/new
  def new
    @stru_expense_det = StruExpenseDet.new
  end

  # GET /stru_expense_dets/1/edit
  def edit
  end

  # POST /stru_expense_dets
  # POST /stru_expense_dets.json
  def create
    @stru_expense_det = StruExpenseDet.new(stru_expense_det_params)

    respond_to do |format|
      if @stru_expense_det.save
        format.html { redirect_to @stru_expense_det, notice: 'Stru expense det was successfully created.' }
        format.json { render :show, status: :created, location: @stru_expense_det }
      else
        format.html { render :new }
        format.json { render json: @stru_expense_det.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stru_expense_dets/1
  # PATCH/PUT /stru_expense_dets/1.json
  def update
    respond_to do |format|
      if @stru_expense_det.update(stru_expense_det_params)
        format.html { redirect_to @stru_expense_det, notice: 'Stru expense det was successfully updated.' }
        format.json { render :show, status: :ok, location: @stru_expense_det }
      else
        format.html { render :edit }
        format.json { render json: @stru_expense_det.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stru_expense_dets/1
  # DELETE /stru_expense_dets/1.json
  def destroy
    @stru_expense_det.destroy
    respond_to do |format|
      format.html { redirect_to stru_expense_dets_url, notice: 'Stru expense det was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stru_expense_det
      @stru_expense_det = StruExpenseDet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stru_expense_det_params
      params.require(:stru_expense_det).permit(:structure_expense_id, :name, :amount, :subtotal)
    end
end
