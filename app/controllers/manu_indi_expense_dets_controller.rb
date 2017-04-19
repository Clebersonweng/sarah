class ManuIndiExpenseDetsController < ApplicationController
  before_action :set_manu_indi_expense_det, only: [:show, :edit, :update, :destroy]

  # GET /manu_indi_expense_dets
  # GET /manu_indi_expense_dets.json
  def index
    @manu_indi_expense_dets = ManuIndiExpenseDet.all
  end

  # GET /manu_indi_expense_dets/1
  # GET /manu_indi_expense_dets/1.json
  def show
  end

  # GET /manu_indi_expense_dets/new
  def new
    @manu_indi_expense_det = ManuIndiExpenseDet.new
  end

  # GET /manu_indi_expense_dets/1/edit
  def edit
  end

  # POST /manu_indi_expense_dets
  # POST /manu_indi_expense_dets.json
  def create
    @manu_indi_expense_det = ManuIndiExpenseDet.new(manu_indi_expense_det_params)

    respond_to do |format|
      if @manu_indi_expense_det.save
        format.html { redirect_to @manu_indi_expense_det, notice: 'Manu indi expense det was successfully created.' }
        format.json { render :show, status: :created, location: @manu_indi_expense_det }
      else
        format.html { render :new }
        format.json { render json: @manu_indi_expense_det.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manu_indi_expense_dets/1
  # PATCH/PUT /manu_indi_expense_dets/1.json
  def update
    respond_to do |format|
      if @manu_indi_expense_det.update(manu_indi_expense_det_params)
        format.html { redirect_to @manu_indi_expense_det, notice: 'Manu indi expense det was successfully updated.' }
        format.json { render :show, status: :ok, location: @manu_indi_expense_det }
      else
        format.html { render :edit }
        format.json { render json: @manu_indi_expense_det.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manu_indi_expense_dets/1
  # DELETE /manu_indi_expense_dets/1.json
  def destroy
    @manu_indi_expense_det.destroy
    respond_to do |format|
      format.html { redirect_to manu_indi_expense_dets_url, notice: 'Manu indi expense det was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manu_indi_expense_det
      @manu_indi_expense_det = ManuIndiExpenseDet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manu_indi_expense_det_params
      params.require(:manu_indi_expense_det).permit(:manu_indi_expense_id, :name, :isFixed, :subtotal)
    end
end
