class CostOperMachine < ApplicationRecord
   belongs_to :program_production
   has_one :depreciation
   has_many :cost_oper_machine_details, inverse_of: :cost_oper_machine, :dependent => :destroy
   accepts_nested_attributes_for :cost_oper_machine_details

   validates_presence_of :program_production,:total

   after_save :create_depreciation, :create_depreciation_details

   # Anos de vida util fijo por no variar segun el decreto
   YEAR_USE_LIFE = 10 
   YEAR_USE_LIFE_REMAIN = 9
  private

   def create_depreciation

      ##############toma los datos para crear primero la cabecera de depreciacion ####################
      cost_oper_machine_id =  self.id
      prog_production      = self.program_production_id
      
      Depreciation.create(program_production_id: prog_production, cost_oper_machine_id: cost_oper_machine_id, total: 0.0)
      ####################### FIN DE CABECERA  ##############################

   end

   def create_depreciation_details
      ####################### INICIO DETALLES DEPRECIACION DETALLES  ##############################
      depreciation_id            = Depreciation.last.id
      revaluation_coefficient_id = RevaluationCoefficient.last.id

      # TRAER COSTO DE MAQUINAS E IMPLEMENTOS
      cost_oper_machine_id       =  self.id

      details                    = CostOperMachineDetail.where(:cost_oper_machine_id =>cost_oper_machine_id)

      details.all.each do |det|
         puts det.machine_id
         puts det.implement_id
         
      end

      abort(" FIN ")
      # FIN COSTO DE MAQUINAS E IMPLEMENTOS
      year_use_life              = YEAR_USE_LIFE
      year_use_life_remain       = YEAR_USE_LIFE_REMAIN

      # valor neto del ejercicio anterior = VC *(AVU - AVUR)
      net_value_prev_year        = 10000
      revalued_value             = 8000
      annual_depre               = 120000
      per_day_depre              = 12000
      per_hour_depre             = 1200
      hours_used                 = 1.2
      subtotal                   = 1440
    
      #DepreciationDetail.create(depreciation_id: depreciation_id, revaluation_coefficient_id: revaluation_coefficient_id, year_use_life: year_use_life,year_use_life_remain: year_use_life_remain,net_value_prev_year: net_value_prev_year,revalued_value: revalued_value,annual_depre: annual_depre,per_day_depre: per_day_depre,per_hour_depre: per_hour_depre,hours_used: hours_used,subtotal: subtotal)


      ####################### FIN DETALLES DEPRECIACION DETALLES  ##############################
   end



end
