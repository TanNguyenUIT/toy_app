require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
  test "signup should fail" do
    assert_no_difference 'User.count' do
      post "/users", params: {
        user: {
          name: "",
          email: "test@gmail.com",
          password: "123",
          password_confirmation: "111"
        }
      }
    end
  end
end
