require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "generate 1 user" do
    assert_equal 0, User.count
    User.generate_users(1)
    assert_equal 1, User.count
    user = User.first
    assert_not_empty user.email
    assert_not_empty user.name
    assert_not_empty user.image_url
  end

  test "generate 10 users" do
    assert_equal 0, User.count
    User.generate_users(10)
    assert_equal 10, User.count
  end


end
