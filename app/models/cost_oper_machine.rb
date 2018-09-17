class CostOperMachine < ApplicationRecord
   belongs_to :program_production
   has_one :depreciation
   has_many :cost_oper_machine_details, inverse_of: :cost_oper_machine, :dependent => :destroy
   accepts_nested_attributes_for :cost_oper_machine_details

   validates_presence_of :program_production,:total

   after_save :create_depreciation, :create_depreciation_details

   # Anos de vida util fijo por no variar segun el decreto
  
   
  private

   def create_depreciation

      ##############toma los datos para crear primero la cabecera de depreciacion ####################
      cost_oper_machine_id =  self.id
      prog_production      = self.program_production_id
      
      Depreciation.create(program_production_id: prog_production, cost_oper_machine_id: cost_oper_machine_id, total: 0.0)
      ####################### FIN DE CABECERA  ##############################

   end

   def create_depreciation_details
      
      year_use_life = 10 
      year_use_life_remain = 9

      #machines_id   = Array.new
      #implements_id = Array.new

      ####################### INICIO DETALLES DEPRECIACION DETALLES  ##############################
      depreciation_id            = Depreciation.last.id
      revaluation_coefficient    = RevaluationCoefficient.select(:coefficient).order("created_at DESC").limit(1).map(&:coefficient)
      revaluation_coefficient_id = RevaluationCoefficient.last.id#RevaluationCoefficient.select(:coefficient).order("created_at DESC").limit(1).map(&:coefficient)

      # TRAER COSTO DE MAQUINAS E IMPLEMENTOS
      cost_oper_machine_id       =  CostOperMachine.last.id #self.id

      details                    = CostOperMachineDetail.where(:cost_oper_machine_id =>self.id)

      details.all.each do |det|
         #machines_id.push(det.machine_id)
         #implements_id.push(det.implement_id)
         
         cost_machine = Machine.where(:id =>det.machine_id ).select(:price,:id).map(&:price) # convierte el objeto hash para el campo que necesito

         #cost_implement = Implement.where(:id =>det.implement_id ).select(:price).map(&:price)

         # Valor Neto Ejercicio Anterior  = VC / (AVU - AVUR)
         vnea_machine = cost_machine[0] / (year_use_life - year_use_life_remain)

         #Valor Revaluado = VNEA / CR
         vr_machine =  vnea_machine / revaluation_coefficient[0]

         #Depreciacion Anual = VR / AVU
         da_machine = vr_machine / year_use_life
         
         #Depreciacion Diaria =  DA / 365
         dd_machine = da_machine / 365
         
         #Depreciacion por Hora = DD / 24
         dh_machine = dd_machine / 24

         #DEPRE = DH * HS USED
         depre_machine_subtotal = dh_machine.round(4) * det.hours_needed

         DepreciationDetail.create(depreciation_id: depreciation_id, revaluation_coefficient_id: revaluation_coefficient_id, year_use_life: year_use_life,year_use_life_remain: year_use_life_remain,net_value_prev_year: vnea_machine.round(4),revalued_value: vr_machine.round(4),annual_depre: da_machine.round(4),per_day_depre: dd_machine.round(4),per_hour_depre: dh_machine.round(4),hours_used: det.hours_needed.round(4),subtotal: depre_machine_subtotal.round(4))
         
      end

      #puts det.errors
      #abort(" FIN ")

      # FIN COSTO DE MAQUINAS E IMPLEMENTOS

      ####################### FIN DETALLES DEPRECIACION DETALLES  ##############################
   end



end
