require "test_helper"

class CreateUserTest < ActionDispatch::IntegrationTest


  test "sign up new user" do
    get signup_path
    assert_template 'users/new'
    @user = User.new(username: "elvan", email: "egaunder@gmail.com", password: "11111")
    @user.save
    assert_response :success do
      assert_redirected_to user_path(@user)
    end

  end


end