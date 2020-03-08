# frozen_string_literal: true

require 'ynab'
require 'ynab/requests/accounts'
require 'ynab/requests/budgets'
require 'ynab/requests/transactions'

module Ynab
  #
  # Ynab Api Client
  #
  class Client
    include Ynab::Requests::Accounts
    include Ynab::Requests::Budgets
    include Ynab::Requests::Transactions

    def initialize
      @api = YNAB::API.new(ENV.fetch('YNAB_ACCESS_TOKEN'))
    end
  end
end
