class FarmingPlotsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_farming_plot, only: [:show, :edit, :update, :destroy]

  # GET /farming_plots
  # GET /farming_plots.json
  def index
    @farming_plots = FarmingPlot.all
    # respond_to do |format|
    #  format.html
    #  format.json { render :json => @farming_plots.to_json(:include => { :type_of_crop => { :only => :name } })}
    #end
  end

  # GET /farming_plots/1
  # GET /farming_plots/1.json
  def show
  end

  # GET /farming_plots/new
  def new
    get_params_plot
    @farming_plot = FarmingPlot.new
   
  end

  # GET /farming_plots/1/edit
  def edit
    get_params_plot
  end

  # POST /farming_plots
  # POST /farming_plots.json
  def create
    get_params_plot
    @farming_plot = FarmingPlot.new(farming_plot_params)

    respond_to do |format|
      if @farming_plot.save
        flash[:notice] = "Creado exitosamente."
        format.html { redirect_to  action:"index"}
      else
        format.html { render :new }
        format.json { render json: @farming_plot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /farming_plots/1
  # PATCH/PUT /farming_plots/1.json
  def update
    get_params_plot
    respond_to do |format|
      if @farming_plot.update(farming_plot_params)
        flash[:notice] = "Actualizado exitosamente."
        format.html { redirect_to  action:"index"}
      else
        format.html { render :edit }
        format.json { render json: @farming_plot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /farming_plots/1
  # DELETE /farming_plots/1.json
  def destroy
    @farming_plot = FarmingPlot.find(params[:id])    
    respond_to do |format|
      if @farming_plot.destroy
        #format.html { redirect_to @type_of_crop, notice: 'Se actualizo exitosamente!' }        
       # res = 1
        #format.json  { render :json => res }
        format.js
        #format.json { status: :created, location: @type_of_crop }
      else
       # res = 0
        #format.json  { render :json => res }
        format.js
      end
    end  
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_farming_plot
    @farming_plot = FarmingPlot.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def farming_plot_params
    params.require(:farming_plot).permit(:code, :name, :area,:person_id ,:description)
  end
  def get_params_plot
    @type_of_crops = TypeOfCrop.all.collect { |type| [type.name, type.id]}
    @person = Person.all.collect { |type| [type.name, type.id]}
    @charts = ChartOfAccount.all.collect {|type| [type.name, type.id]}
  end
end
