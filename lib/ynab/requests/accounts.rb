# frozen_string_literal: true

module Ynab
  module Requests
    module Accounts
      #
      # Retrieves user accounts for the specified budget
      #
      # @param [String] budget_id Budget external identified
      #
      # @return [Array<Hash>] List of accounts
      #
      def accounts(budget_id)
        @api.accounts.get_accounts(budget_id)&.data&.accounts&.map(&:to_hash)
      end
    end
  end
end
