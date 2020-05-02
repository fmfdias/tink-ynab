# frozen_string_literal: true

class SynchronizationsController < ApplicationController
  # To add force user to authenticate, uncomment bellow.
  # before_action :require_user!

  skip_before_action :verify_authenticity_token

  def create
    result = Ynab::CreateTransactions.new.call(transaction_data)
    if result.success?
      render json: result.transactions, root: nil
    else
      render json: { error: 'Failed' }, root: nil
    end
  end

  private

  def synchronzation_params
    params.require(:synchronization).permit(:ynab_account_id, :ynab_budget_id)
  end

  def ynab_budget
    @ynab_budget ||= YnabBudget.find(synchronzation_params[:ynab_budget_id])
  end

  def ynab_account
    @ynab_account ||= YnabAccount.find(synchronzation_params[:ynab_account_id])
  end

  def transaction_data
    {
      budget_external_id: ynab_budget.external_id,
      account_external_id: ynab_account.external_id,
      transactions: [
        {
          date: Date.today,
          payee_name: 'Another Test Payee',
          memo: 'I was also created through the API',
          cleared: 'Uncleared',
          approved: false,
          amount: 232
        },
        {
          date: Date.today,
          payee_name: 'Another Test Payee',
          memo: 'I was also created through the API',
          cleared: 'Uncleared',
          approved: false,
          amount: 343
        }
      ]
    }
  end
end
