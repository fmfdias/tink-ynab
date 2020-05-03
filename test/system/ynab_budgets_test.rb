require "application_system_test_case"

class YnabBudgetsTest < ApplicationSystemTestCase
  setup do
    @ynab_budget = ynab_budgets(:one)
  end

  test "visiting the index" do
    visit ynab_budgets_url
    assert_selector "h1", text: "Ynab Budgets"
  end

  test "creating a Ynab budget" do
    visit ynab_budgets_url
    click_on "New Ynab Budget"

    fill_in "External", with: @ynab_budget.external_id
    fill_in "Name", with: @ynab_budget.name
    fill_in "User", with: @ynab_budget.user_id
    click_on "Create Ynab budget"

    assert_text "Ynab budget was successfully created"
    click_on "Back"
  end

  test "updating a Ynab budget" do
    visit ynab_budgets_url
    click_on "Edit", match: :first

    fill_in "External", with: @ynab_budget.external_id
    fill_in "Name", with: @ynab_budget.name
    fill_in "User", with: @ynab_budget.user_id
    click_on "Update Ynab budget"

    assert_text "Ynab budget was successfully updated"
    click_on "Back"
  end

  test "destroying a Ynab budget" do
    visit ynab_budgets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ynab budget was successfully destroyed"
  end
end
