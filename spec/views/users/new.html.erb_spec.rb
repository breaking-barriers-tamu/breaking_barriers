require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      access_level: 1,
      name: "MyString",
      major: "MyString",
      year: 1,
      phone_number: "MyString",
      email: "MyString"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input[name=?]", "user[access_level]"

      assert_select "input[name=?]", "user[name]"

      assert_select "input[name=?]", "user[major]"

      assert_select "input[name=?]", "user[year]"

      assert_select "input[name=?]", "user[phone_number]"

      assert_select "input[name=?]", "user[email]"
    end
  end
end
