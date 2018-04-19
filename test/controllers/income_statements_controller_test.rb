require 'test_helper'

class IncomeStatementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get income_statements_index_url
    assert_response :success
  end

end
