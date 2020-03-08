class YnabBudget < ApplicationRecord
  belongs_to :user
  has_many :ynab_accounts
end
