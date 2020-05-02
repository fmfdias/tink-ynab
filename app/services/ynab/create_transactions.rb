# frozen_string_literal: true

require 'hanami/interactor'

module Ynab
  #
  # Helper service to Create transactions
  #
  class CreateTransactions
    include Hanami::Interactor

    expose :transactions

    def initialize
      @client = Ynab::Client.new
    end

    #
    # Creates transactions in the specified account
    #
    # @param [Hash<Symbol, Object>] params Transaction data
    # @option params [String] :budget_external_id The bugdet external id
    # @option params [String] :account_external_id The account external id
    # @option params [Array<Hash>] :transactions Transactions to be created
    #
    # @example Creating transactions
    #
    #   Ynab::CreateTransactions.new.call({
    #     budget_external_id: 'sid-asodoas-aosdias',
    #     account_external_id: 'sid-asodoas-aosdias',
    #     transactions: [
    #       {
    #         date: Date.today,
    #         payee_name: 'Another Test Payee',
    #         memo: 'I was also created through the API',
    #         cleared: 'Uncleared',
    #         approved: false,
    #         amount: 343
    #       }
    #     ]
    #   })
    #
    def call(params)
      @transactions = @client.create_transactions(
        params[:budget_external_id],
        map_transactions(params)
      )
    end

    def valid?(params)
      params[:budget_external_id].present? &&
        params[:account_external_id].present? &&
        params[:transactions].present?
    end

    private

    def map_transactions(params)
      params[:transactions].map do |data|
        data.tap { |t| t[:account_id] = params[:account_external_id] }
      end
    end
  end
end
