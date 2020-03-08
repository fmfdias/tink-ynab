class CreateYnabAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :ynab_accounts do |t|
      t.string :external_id
      t.string :name
      t.string :type
      t.string :server_knowledge
      t.string :budget_id
      t.belongs_to :user

      t.timestamps
    end
  end
end
