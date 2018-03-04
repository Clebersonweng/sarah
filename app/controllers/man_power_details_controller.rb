class ManPowerDetailsController < ApplicationController
  before_action :set_man_power_detail, only: [:show, :edit, :update, :destroy]

  respond_to :html

   def index
    @man_power_details = ManPowerDetail.all
    respond_with(@man_power_details)
   end

   def show
      respond_with(@man_power_detail)
   end

   def new
    @man_power_detail = ManPowerDetail.new
    respond_with(@man_power_detail)
   end

   def edit
   end

   def create
    @man_power_detail = ManPowerDetail.new(man_power_detail_params)
    @man_power_detail.save
    respond_with(@man_power_detail)
   end

   def update
    @man_power_detail.update(man_power_detail_params)
    respond_with(@man_power_detail)
   end

   def destroy
    @man_power_detail.destroy
    respond_with(@man_power_detail)
   end

   private
   def set_man_power_detail
      @man_power_detail = ManPowerDetail.find(params[:id])
   end

   def man_power_detail_params
      params.require(:man_power_detail).permit(:man_power_id, :type_of_work_id, :person_id, :hours_needed, :subtotal)
   end
end
