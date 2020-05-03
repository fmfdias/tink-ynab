require 'test_helper'

class YnabBudgetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ynab_budget = ynab_budgets(:one)
  end

  test "should get index" do
    get ynab_budgets_url
    assert_response :success
  end

  test "should get new" do
    get new_ynab_budget_url
    assert_response :success
  end

  test "should create ynab_budget" do
    assert_difference('YnabBudget.count') do
      post ynab_budgets_url, params: { ynab_budget: { external_id: @ynab_budget.external_id, name: @ynab_budget.name, user_id: @ynab_budget.user_id } }
    end

    assert_redirected_to ynab_budget_url(YnabBudget.last)
  end

  test "should show ynab_budget" do
    get ynab_budget_url(@ynab_budget)
    assert_response :success
  end

  test "should get edit" do
    get edit_ynab_budget_url(@ynab_budget)
    assert_response :success
  end

  test "should update ynab_budget" do
    patch ynab_budget_url(@ynab_budget), params: { ynab_budget: { external_id: @ynab_budget.external_id, name: @ynab_budget.name, user_id: @ynab_budget.user_id } }
    assert_redirected_to ynab_budget_url(@ynab_budget)
  end

  test "should destroy ynab_budget" do
    assert_difference('YnabBudget.count', -1) do
      delete ynab_budget_url(@ynab_budget)
    end

    assert_redirected_to ynab_budgets_url
  end
end
