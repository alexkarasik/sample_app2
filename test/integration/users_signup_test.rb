require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: "Example User",
                                         email: "user@example.com",
                                         password:            "foo",
                                         password_confirmation: "bar" }}
      end
      follow_redirect!
      assert_template 'users/show'
    end
end
