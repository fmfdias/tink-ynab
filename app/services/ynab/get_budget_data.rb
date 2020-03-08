# frozen_string_literal: true

require 'hanami/interactor'

module Ynab
  #
  # Helper service to get all accounts
  # for all bugets
  #
  class GetBudgetData
    include Hanami::Interactor

    expose :budgets

    def initialize
      @client = Ynab::Client.new
    end

    #
    # Retrieves user accounts
    #
    # @return [Array<Hash>] List of accounts
    #
    def call
      result = @client.budgets
      return if result&.empty?

      @budgets = result.map { |budget| accounts(budget) }
    end

    private

    def accounts(budget)
      result = @client.accounts(budget[:id])
      return budget if result&.empty?

      budget.tap { |b| b[:accounts] = result }
    end
  end
end
