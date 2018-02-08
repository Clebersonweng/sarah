class TypeMachinesController < ApplicationController
  before_action :set_type_machine, only: [:show, :edit, :update, :destroy]


  def index
    breadcrumb
    @type_machines = TypeMachine.all
    respond_with(@type_machines)
  end

  def show
    respond_with(@type_machine)
  end

  def new
   breadcrumb
    @type_machine = TypeMachine.new
    respond_with(@type_machine)
  end

  def edit
   breadcrumb
  end

  def create
    @type_machine = TypeMachine.new(type_machine_params)
    @type_machine.save
    respond_with(@type_machine)
  end

  def update
    @type_machine.update(type_machine_params)
    respond_with(@type_machine)
  end

  def destroy
    @type_machine.destroy
    respond_with(@type_machine)
  end

  private
    def set_type_machine
      @type_machine = TypeMachine.find(params[:id])
    end

    def type_machine_params
      params.require(:type_machine).permit(:description)
    end
   def breadcrumb
      @path = "/ catastros / máquinas & implementos / clasificación"
   end

end
