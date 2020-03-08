# frozen_string_literal: true
class User < ApplicationRecord
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  passwordless_with :email

  has_many :ynab_budgets
  has_many :ynab_accounts, through: :ynab_budgets
end
