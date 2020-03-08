# frozen_string_literal: true

class YnabAccount < ApplicationRecord
  belongs_to :ynab_budget
  delegate :user, to: :ynab_budget
end
