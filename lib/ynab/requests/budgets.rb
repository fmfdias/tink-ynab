# frozen_string_literal: true

module Ynab
  module Requests
    module Budgets
      #
      # Retrieves user budgets
      #
      # @return [Array<Hash>] Budget list
      #
      def budgets
        @api.budgets.get_budgets&.data&.budgets&.map(&:to_hash)
      end
    end
  end
end
