# frozen_string_literal: true
# require 'rails_helper'

# RSpec.describe "users/edit", type: :view do
#   let(:user) {
#     User.create!(
#       access_level: 1,
#       name: "MyString",
#       major: "MyString",
#       year: 1,
#       phone_number: "MyString",
#       email: "MyString"
#     )
#   }

#   before(:each) do
#     assign(:user, user)
#   end

#   it "renders the edit user form" do
#     render

#     assert_select "form[action=?][method=?]", user_path(user), "post" do

#       assert_select "input[name=?]", "user[access_level]"

#       assert_select "input[name=?]", "user[name]"

#       assert_select "input[name=?]", "user[major]"

#       assert_select "input[name=?]", "user[year]"

#       assert_select "input[name=?]", "user[phone_number]"

#       assert_select "input[name=?]", "user[email]"
#     end
#   end
# end
