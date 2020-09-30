require "application_system_test_case"

class YnabAccountsTest < ApplicationSystemTestCase
  setup do
    @ynab_account = ynab_accounts(:one)
  end

  test "visiting the index" do
    visit ynab_accounts_url
    assert_selector "h1", text: "Ynab Accounts"
  end

  test "creating a Ynab account" do
    visit ynab_accounts_url
    click_on "New Ynab Account"

    fill_in "Account type", with: @ynab_account.account_type
    fill_in "External", with: @ynab_account.external_id
    fill_in "Name", with: @ynab_account.name
    fill_in "Ynab budget", with: @ynab_account.ynab_budget_id
    click_on "Create Ynab account"

    assert_text "Ynab account was successfully created"
    click_on "Back"
  end

  test "updating a Ynab account" do
    visit ynab_accounts_url
    click_on "Edit", match: :first

    fill_in "Account type", with: @ynab_account.account_type
    fill_in "External", with: @ynab_account.external_id
    fill_in "Name", with: @ynab_account.name
    fill_in "Ynab budget", with: @ynab_account.ynab_budget_id
    click_on "Update Ynab account"

    assert_text "Ynab account was successfully updated"
    click_on "Back"
  end

  test "destroying a Ynab account" do
    visit ynab_accounts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ynab account was successfully destroyed"
  end
end
