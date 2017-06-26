require 'test_helper'

class DynamicTablesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dynamic_tables_index_url
    assert_response :success
  end

end
