require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    assert_no_difference 'User.count', 1 do
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

  test "valid signup information" do
    assert_difference 'User.count', 1 do
      post "/users", params: {
        user: {
          name: "test",
          email: "test@gmail.com",
          password: "123456",
          password_confirmation: "123456"
        }
      }
    end
  end
end
