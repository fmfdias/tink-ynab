class YnabAccountsController < ApplicationController
  before_action :set_ynab_budget, only: [:index, :new]
  before_action :set_ynab_account, only: [:show, :edit, :update, :destroy]

  # GET /ynab_accounts
  # GET /ynab_accounts.json
  def index
    @ynab_accounts = @ynab_budget.ynab_accounts
  end

  # GET /ynab_accounts/1
  # GET /ynab_accounts/1.json
  def show
  end

  # GET /ynab_accounts/new
  def new
    @ynab_account = @ynab_budget.ynab_accounts.build
  end

  # GET /ynab_accounts/1/edit
  def edit
  end

  # POST /ynab_accounts
  # POST /ynab_accounts.json
  def create
    @ynab_account = YnabAccount.new(ynab_account_params)

    respond_to do |format|
      if @ynab_account.save
        format.html { redirect_to @ynab_account, notice: 'Ynab account was successfully created.' }
        format.json { render :show, status: :created, location: @ynab_account }
      else
        format.html { render :new }
        format.json { render json: @ynab_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ynab_accounts/1
  # PATCH/PUT /ynab_accounts/1.json
  def update
    respond_to do |format|
      if @ynab_account.update(ynab_account_params)
        format.html { redirect_to @ynab_account, notice: 'Ynab account was successfully updated.' }
        format.json { render :show, status: :ok, location: @ynab_account }
      else
        format.html { render :edit }
        format.json { render json: @ynab_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ynab_accounts/1
  # DELETE /ynab_accounts/1.json
  def destroy
    @ynab_account.destroy
    respond_to do |format|
      format.html { redirect_to ynab_accounts_url, notice: 'Ynab account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ynab_account
      @ynab_account = YnabAccount.where(ynab_budget_id: params[:ynab_budget_id]).find(params[:id])
    end

    def set_ynab_budget
      @ynab_budget = YnabBudget.find(params[:ynab_budget_id])
    end

    # Only allow a list of trusted parameters through.
    def ynab_account_params
      params.require(:ynab_account).permit(:name, :external_id, :account_type, :ynab_budget_id)
    end
end
