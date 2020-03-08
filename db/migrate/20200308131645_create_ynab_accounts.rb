class CreateYnabAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :ynab_accounts do |t|
      t.string :external_id
      t.string :name
      t.string :account_type
      t.references :ynab_budget

      t.timestamps
    end
  end
end
