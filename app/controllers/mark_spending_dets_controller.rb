class MarkSpendingDetsController < ApplicationController
  before_action :set_mark_spending_det, only: [:show, :edit, :update, :destroy]

  # GET /mark_spending_dets
  # GET /mark_spending_dets.json
  def index
    @mark_spending_dets = MarkSpendingDet.all
  end

  # GET /mark_spending_dets/1
  # GET /mark_spending_dets/1.json
  def show
  end

  # GET /mark_spending_dets/new
  def new
    @mark_spending_det = MarkSpendingDet.new
  end

  # GET /mark_spending_dets/1/edit
  def edit
  end

  # POST /mark_spending_dets
  # POST /mark_spending_dets.json
  def create
    @mark_spending_det = MarkSpendingDet.new(mark_spending_det_params)

    respond_to do |format|
      if @mark_spending_det.save
        format.html { redirect_to @mark_spending_det, notice: 'Mark spending det was successfully created.' }
        format.json { render :show, status: :created, location: @mark_spending_det }
      else
        format.html { render :new }
        format.json { render json: @mark_spending_det.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mark_spending_dets/1
  # PATCH/PUT /mark_spending_dets/1.json
  def update
    respond_to do |format|
      if @mark_spending_det.update(mark_spending_det_params)
        format.html { redirect_to @mark_spending_det, notice: 'Mark spending det was successfully updated.' }
        format.json { render :show, status: :ok, location: @mark_spending_det }
      else
        format.html { render :edit }
        format.json { render json: @mark_spending_det.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mark_spending_dets/1
  # DELETE /mark_spending_dets/1.json
  def destroy
    @mark_spending_det.destroy
    respond_to do |format|
      format.html { redirect_to mark_spending_dets_url, notice: 'Mark spending det was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mark_spending_det
      @mark_spending_det = MarkSpendingDet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mark_spending_det_params
      params.require(:mark_spending_det).permit(:mark_spending_id, :name, :amount, :descr, :is_fixed, :subtotal)
    end
end
