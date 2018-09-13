class DepreciationsController < ApplicationController
  before_action :set_depreciation, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @depreciations = Depreciation.all
    respond_with(@depreciations)
  end

  def show
    respond_with(@depreciation)
  end

  def new
    @depreciation = Depreciation.new
    respond_with(@depreciation)
  end

  def edit
  end

  def create
    @depreciation = Depreciation.new(depreciation_params)
    @depreciation.save
    respond_with(@depreciation)
  end

  def update
    @depreciation.update(depreciation_params)
    respond_with(@depreciation)
  end

  def destroy
    @depreciation.destroy
    respond_with(@depreciation)
  end

  private
    def set_depreciation
      @depreciation = Depreciation.find(params[:id])
    end

    def depreciation_params
      params.require(:depreciation).permit(:program_production_id, :cost_oper_machine_id, :total)
    end
end
