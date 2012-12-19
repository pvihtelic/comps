require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase
  setup do
    @company = companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company" do
    assert_difference('Company.count') do
      post :create, company: { earnings_cy: @company.earnings_cy, earnings_cy_plus_one: @company.earnings_cy_plus_one, earnings_ltm: @company.earnings_ltm, enterprise_value: @company.enterprise_value, market_cap: @company.market_cap, name: @company.name, sales_cy: @company.sales_cy, sales_cy_plus_one: @company.sales_cy_plus_one, sales_ltm: @company.sales_ltm, ticker: @company.ticker }
    end

    assert_redirected_to company_path(assigns(:company))
  end

  test "should show company" do
    get :show, id: @company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company
    assert_response :success
  end

  test "should update company" do
    put :update, id: @company, company: { earnings_cy: @company.earnings_cy, earnings_cy_plus_one: @company.earnings_cy_plus_one, earnings_ltm: @company.earnings_ltm, enterprise_value: @company.enterprise_value, market_cap: @company.market_cap, name: @company.name, sales_cy: @company.sales_cy, sales_cy_plus_one: @company.sales_cy_plus_one, sales_ltm: @company.sales_ltm, ticker: @company.ticker }
    assert_redirected_to company_path(assigns(:company))
  end

  test "should destroy company" do
    assert_difference('Company.count', -1) do
      delete :destroy, id: @company
    end

    assert_redirected_to companies_path
  end
end
