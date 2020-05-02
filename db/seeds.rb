# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.find_or_create_by!(email: ENV.fetch('USER_EMAIL'))

Ynab::GetBudgetData.new.call.budgets.each do |budget|
  ynab_budget = YnabBudget.find_or_create_by!(external_id: budget[:id]) do |b|
    b.name = budget[:name]
    b.user = user
  end

  budget.fetch(:accounts).each do |account|
    YnabAccount.find_or_create_by!(external_id: account[:id]) do |ynab_account|
      ynab_account.name = account[:name]
      ynab_account.account_type = account[:type]
      ynab_account.ynab_budget = ynab_budget
    end
  end
end
