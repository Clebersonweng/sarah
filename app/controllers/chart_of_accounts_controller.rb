class ChartOfAccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chart_of_account, only: [:show, :edit, :update, :destroy]

  # GET /chart_of_accounts
  # GET /chart_of_accounts.json
  def index
    @chart_of_accounts = ChartOfAccount.all
  end

  # GET /chart_of_accounts/1
  # GET /chart_of_accounts/1.json
  def show
  end

  # GET /chart_of_accounts/new
  def new
    @chart_of_account = ChartOfAccount.new
  end

  # GET /chart_of_accounts/1/edit
  def edit
  end

  # POST /chart_of_accounts
  # POST /chart_of_accounts.json
  def create
    @chart_of_account = ChartOfAccount.new(chart_of_account_params)

    respond_to do |format|
      if @chart_of_account.save
        format.html { redirect_to @chart_of_account, notice: 'Chart of account was successfully created.' }
        format.json { render :show, status: :created, location: @chart_of_account }
      else
        format.html { render :new }
        format.json { render json: @chart_of_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chart_of_accounts/1
  # PATCH/PUT /chart_of_accounts/1.json
  def update
    respond_to do |format|
      if @chart_of_account.update(chart_of_account_params)
        format.html { redirect_to @chart_of_account, notice: 'Chart of account was successfully updated.' }
        format.json { render :show, status: :ok, location: @chart_of_account }
      else
        format.html { render :edit }
        format.json { render json: @chart_of_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chart_of_accounts/1
  # DELETE /chart_of_accounts/1.json
  def destroy
    @chart_of_account.destroy
    respond_to do |format|
      format.html { redirect_to chart_of_accounts_url, notice: 'Chart of account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_chart_of_account
    @chart_of_account = ChartOfAccount.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def chart_of_account_params
    params.require(:chart_of_account).permit(:code, :name)
  end
end
