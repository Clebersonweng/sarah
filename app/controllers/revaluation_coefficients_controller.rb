class RevaluationCoefficientsController < ApplicationController
   before_action :set_revaluation_coefficient, only: [:show, :edit, :update, :destroy]

   respond_to :html

   def index
      get_all
      @revaluation_coefficients = RevaluationCoefficient.all
      respond_with(@revaluation_coefficients)
   end

   def show
      respond_with(@revaluation_coefficient)
   end

   def new
      get_all
      @revaluation_coefficient = RevaluationCoefficient.new
      respond_with(@revaluation_coefficient)
   end

   def edit
      get_all
   end

   def create
      @revaluation_coefficient = RevaluationCoefficient.new(revaluation_coefficient_params)
      @revaluation_coefficient.save
      respond_with(@revaluation_coefficient)
   end

   def update
      @revaluation_coefficient.update(revaluation_coefficient_params)
      respond_with(@revaluation_coefficient)
   end

   def destroy
      @revaluation_coefficient.destroy
      respond_with(@revaluation_coefficient)
   end

   private
   def set_revaluation_coefficient
      @revaluation_coefficient = RevaluationCoefficient.find(params[:id])
   end

   def revaluation_coefficient_params
      params.require(:revaluation_coefficient).permit(:start_period, :end_period, :coefficient)
   end

   def get_all
      @path = " / configuraciones / coeficiente de revalúo"
      @edit_name      = "Editar coeficiente de revalúo"
   end

end
