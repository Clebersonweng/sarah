class MarkSpendingsController < ApplicationController
  before_action :set_mark_spending, only: [:show, :edit, :update, :destroy]

  # GET /mark_spendings
  # GET /mark_spendings.json
  def index
    @mark_spendings = MarkSpending.all
  end

  # GET /mark_spendings/1
  # GET /mark_spendings/1.json
  def show
  end

  # GET /mark_spendings/new
  def new
    @mark_spending = MarkSpending.new
  end

  # GET /mark_spendings/1/edit
  def edit
  end

  # POST /mark_spendings
  # POST /mark_spendings.json
  def create
    @mark_spending = MarkSpending.new(mark_spending_params)

    respond_to do |format|
      if @mark_spending.save
        format.html { redirect_to @mark_spending, notice: 'Mark spending was successfully created.' }
        format.json { render :show, status: :created, location: @mark_spending }
      else
        format.html { render :new }
        format.json { render json: @mark_spending.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mark_spendings/1
  # PATCH/PUT /mark_spendings/1.json
  def update
    respond_to do |format|
      if @mark_spending.update(mark_spending_params)
        format.html { redirect_to @mark_spending, notice: 'Mark spending was successfully updated.' }
        format.json { render :show, status: :ok, location: @mark_spending }
      else
        format.html { render :edit }
        format.json { render json: @mark_spending.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mark_spendings/1
  # DELETE /mark_spendings/1.json
  def destroy
    @mark_spending.destroy
    respond_to do |format|
      format.html { redirect_to mark_spendings_url, notice: 'Mark spending was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mark_spending
      @mark_spending = MarkSpending.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mark_spending_params
      params.require(:mark_spending).permit(:estimate_sale_id, :chart_of_account_id, :total)
    end
end
