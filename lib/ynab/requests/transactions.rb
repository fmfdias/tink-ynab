# frozen_string_literal: true

module Ynab
  module Requests
    module Transactions
      #
      # Creates transactions for the specified budget
      #
      # @param [String] budget_id Budget external identified
      # @param [Array<Hash>] transaction_data Transactions to be saved
      #
      # @return [Array<Hash>] Created transactions
      #
      def create_transactions(budget_id, transaction_data)
        data = { transactions: transaction_data }
        response = @api.transactions.create_transaction(budget_id, data)
        response&.data&.transactions&.map(&:to_hash)
      end
    end
  end
end
