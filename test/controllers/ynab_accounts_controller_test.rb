require 'test_helper'

class YnabAccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ynab_account = ynab_accounts(:one)
  end

  test "should get index" do
    get ynab_accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_ynab_account_url
    assert_response :success
  end

  test "should create ynab_account" do
    assert_difference('YnabAccount.count') do
      post ynab_accounts_url, params: { ynab_account: { account_type: @ynab_account.account_type, external_id: @ynab_account.external_id, name: @ynab_account.name, ynab_budget_id: @ynab_account.ynab_budget_id } }
    end

    assert_redirected_to ynab_account_url(YnabAccount.last)
  end

  test "should show ynab_account" do
    get ynab_account_url(@ynab_account)
    assert_response :success
  end

  test "should get edit" do
    get edit_ynab_account_url(@ynab_account)
    assert_response :success
  end

  test "should update ynab_account" do
    patch ynab_account_url(@ynab_account), params: { ynab_account: { account_type: @ynab_account.account_type, external_id: @ynab_account.external_id, name: @ynab_account.name, ynab_budget_id: @ynab_account.ynab_budget_id } }
    assert_redirected_to ynab_account_url(@ynab_account)
  end

  test "should destroy ynab_account" do
    assert_difference('YnabAccount.count', -1) do
      delete ynab_account_url(@ynab_account)
    end

    assert_redirected_to ynab_accounts_url
  end
end
