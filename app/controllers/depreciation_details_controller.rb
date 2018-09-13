class DepreciationDetailsController < ApplicationController
  before_action :set_depreciation_detail, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @depreciation_details = DepreciationDetail.all
    respond_with(@depreciation_details)
  end

  def show
    respond_with(@depreciation_detail)
  end

  def new
    @depreciation_detail = DepreciationDetail.new
    respond_with(@depreciation_detail)
  end

  def edit
  end

  def create
    @depreciation_detail = DepreciationDetail.new(depreciation_detail_params)
    @depreciation_detail.save
    respond_with(@depreciation_detail)
  end

  def update
    @depreciation_detail.update(depreciation_detail_params)
    respond_with(@depreciation_detail)
  end

  def destroy
    @depreciation_detail.destroy
    respond_with(@depreciation_detail)
  end

  private
    def set_depreciation_detail
      @depreciation_detail = DepreciationDetail.find(params[:id])
    end

    def depreciation_detail_params
      params.require(:depreciation_detail).permit(:depreciation_id, :cost_oper_machine_id, :revaluation_coefficient_id, :year_use_life, :year_use_life_remain, :net_value_prev_year, :revalued_value, :annual_depre, :per_day_depre, :per_hour_depre, :hours_used, :subtotal)
    end
end
