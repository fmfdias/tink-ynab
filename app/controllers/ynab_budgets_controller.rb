class YnabBudgetsController < ApplicationController
  before_action :set_ynab_budget, only: [:show, :edit, :update, :destroy]

  # GET /ynab_budgets
  # GET /ynab_budgets.json
  def index
    @ynab_budgets = YnabBudget.all.includes(:user)
  end

  # GET /ynab_budgets/1
  # GET /ynab_budgets/1.json
  def show
  end

  # GET /ynab_budgets/new
  def new
    @ynab_budget = YnabBudget.new
  end

  # GET /ynab_budgets/1/edit
  def edit
  end

  # POST /ynab_budgets
  # POST /ynab_budgets.json
  def create
    @ynab_budget = YnabBudget.new(ynab_budget_params)

    respond_to do |format|
      if @ynab_budget.save
        format.html { redirect_to @ynab_budget, notice: 'Ynab budget was successfully created.' }
        format.json { render :show, status: :created, location: @ynab_budget }
      else
        format.html { render :new }
        format.json { render json: @ynab_budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ynab_budgets/1
  # PATCH/PUT /ynab_budgets/1.json
  def update
    respond_to do |format|
      if @ynab_budget.update(ynab_budget_params)
        format.html { redirect_to @ynab_budget, notice: 'Ynab budget was successfully updated.' }
        format.json { render :show, status: :ok, location: @ynab_budget }
      else
        format.html { render :edit }
        format.json { render json: @ynab_budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ynab_budgets/1
  # DELETE /ynab_budgets/1.json
  def destroy
    @ynab_budget.destroy
    respond_to do |format|
      format.html { redirect_to ynab_budgets_url, notice: 'Ynab budget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ynab_budget
      @ynab_budget = YnabBudget.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ynab_budget_params
      params.require(:ynab_budget).permit(:name, :external_id, :user_id)
    end
end
