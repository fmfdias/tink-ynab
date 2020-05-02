class CreateYnabBudgets < ActiveRecord::Migration[6.0]
  def change
    create_table :ynab_budgets do |t|
      t.string :name
      t.string :external_id
      t.references :user

      t.timestamps
    end
  end
end
