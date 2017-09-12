class FarmingPlotsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_farming_plot, only: [:show, :edit, :update, :destroy]

  # GET /farming_plots
  # GET /farming_plots.json
  def index
    @farming_plots = FarmingPlot.all
  end

  # GET /farming_plots/1
  # GET /farming_plots/1.json
  def show
  end

  # GET /farming_plots/new
  def new
    get_all
    @farming_plot = FarmingPlot.new
   
  end

  # GET /farming_plots/1/edit
  def edit
    get_all
  end

  # POST /farming_plots
  # POST /farming_plots.json
  def create
    get_all
    @farming_plot = FarmingPlot.new(farming_plot_params)
    
    if @farming_plot.save
      render json: { contenido: @farming_plot, location: farming_plot_url(@farming_plot),result: :ok },status: 200
    else
      render json:  @farming_plot.errors, status: :unprocessable_entity 
    end
  end

  # PATCH/PUT /farming_plots/1
  # PATCH/PUT /farming_plots/1.json
  def update
    get_all   
    if @farming_plot.update(farming_plot_params)
      render json: { contenido: @farming_plot, location: farming_plot_url(@farming_plot),result: :ok },status: 200
    else
      render json:  @farming_plot.errors, status: :unprocessable_entity   
    end
  end

  # DELETE /farming_plots/1
  # DELETE /farming_plots/1.json
  def destroy
    @farming_plot = TypeOfCrop.find(params[:id]) 
    
    respond_to do |format|
      if @farming_plot.destroy
        format.js
      else
        format.js
      end
    end 
  end

  private
 
  def set_farming_plot
    @farming_plot = FarmingPlot.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def farming_plot_params
    params.require(:farming_plot).permit(:name, :area,:person_id ,:description)
  end
  def get_all
    @type_of_crops = TypeOfCrop.all.collect { |type| [type.name, type.id]}
    @person = Person.all.collect { |type| [type.name, type.id]}
    @charts = ChartOfAccount.all.collect {|type| [type.name, type.id]}
  end
end
