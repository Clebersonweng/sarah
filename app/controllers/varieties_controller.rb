class VarietiesController < ApplicationController
  before_action :set_variety, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    get_all
    @varieties = Variety.all
    respond_with(@varieties)
  end

  def show
    respond_with(@variety)
  end

  def new
    get_all
    @variety = Variety.new
    respond_with(@variety)
  end

  def edit
    get_all
  end

   def create
      get_all
      @variety = Variety.new(variety_params)
      if @variety.save
         render :json => {:contenido => @variety,:result => "ok"}
      else
        render json:  @variety.errors ,:data =>@variety.errors, status: :unprocessable_entity  
      end
   end

  def update
    get_all
    

    if @variety.update(variety_params)
      render json: { contenido: @variety, location: variety_url(@variety),result: :ok },status: 200
    else
      render json:  @variety.errors, status: :unprocessable_entity 
    end
  end

  def check_rel(_id)
    exist_relation = TypeOfCrop.where(:variety_id => _id)
    return true if exist_relation.count == 0
    # or errors.add_to_base in Rails 2
    false
    #flash[:alert] = "El registro contiene relaciones con tipo de cultivo!"

    # Rails 5
    #throw(:abort)
  end

  def destroy
    @variety        = Variety.find(params[:id]) 
    if check_rel(params[:id]) 
        respond_to do |format|
            if @variety.destroy
              format.json { head :no_content }
            else
              render json: { contenido: @variety, location: variety_url(@variety),message: :"no puede ser eliminado" },status: 400
            end
        end  
    else
      render json:  @variety.errors, status: :bad_request 
    end

  end


  private
    def set_variety
      @variety = Variety.find(params[:id])
    end

    def variety_params
      params.require(:variety).permit(:descr)
    end
    def get_all
      @path           = "/ catastros / parcela / variedades"
      @edit_name      = "Editar variedad"
    end
end
