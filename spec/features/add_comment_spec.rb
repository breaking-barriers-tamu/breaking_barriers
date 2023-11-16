# frozen_string_literal: true

require 'rails_helper'

describe 'Comment Feature', type: :feature do
  let!(:member) { create(:user, first_name: 'first_name_1', last_name: 'last_name_1', phone_number: '(214) 123 - 4567', access_level: 0, registration_completed: true) }
  let!(:admin) { create(:user, first_name: 'admin', last_name: 'admin', phone_number: '(214) 123 - 4567', access_level: 1, registration_completed: true) }
  let!(:announcement) { create(:announcement) }

  # --- Sunny Day: Adding a Valid Comment ---
  it 'Add a valid comment' do
    sign_in(member)
    visit announcement_path(announcement)

    comment_content = 'This is a valid comment.'
    fill_in 'comment_box', with: comment_content
    click_button 'Add Comment'

    expect(page).to(have_content('Comment was successfully created.'))
    expect(page).to(have_content(comment_content))
  end

  # --- Rainy Day: Adding an Empty Comment ---
  it 'Add an empty comment' do
    sign_in(member)
    visit announcement_path(announcement)
    # Leaving the comment content empty

    click_button 'Add Comment'

    expect(page).to(have_content('Invalid Comment. Cannot add empty comment'))
    expect(page).not_to(have_content('This is a valid comment.'))
  end

  # --- Sunny Day: Deleting a Comment (Member) ---
  it 'Member deleting their own comment' do
    sign_in(member)
    user_comment = create(:comment, user: member, announcement: announcement)

    visit announcement_path(announcement)
    expect(page).to(have_content(user_comment.content))

    within "#comment_#{user_comment.id}" do
      click_button 'Delete Comment'
    end

    expect(page).to(have_content('Comment was successfully archived.'))
    expect(page).not_to(have_content(user_comment.content))
  end

  # --- Rainy Day: Deleting a Comment (Member) ---
  it 'Member deleting another users comment' do
    sign_in(member)
    admin_comment = create(:comment, user: admin, announcement: announcement)

    visit announcement_path(announcement)

    expect(page).to(have_content(admin_comment.content))
    expect(page).not_to(have_content('Delete comment'))
  end

  # --- Sunny Day: Deleting a Comment (Admin) ---
  it 'Admin deleting another users comment' do
    sign_in(admin)
    member_comment = create(:comment, user: member, announcement: announcement)

    visit announcement_path(announcement)
    expect(page).to(have_content(member_comment.content))

    within "#comment_#{member_comment.id}" do
      click_button 'Delete Comment'
    end

    expect(page).to(have_content('Comment was successfully deleted.'))
    expect(page).not_to(have_content(member_comment.content))
  end

  # --- Sunny Day: Viewing an Archived Comment (Admin) ---
  it 'Admin seeing a user deleted comment' do
    sign_in(member)
    member_comment = create(:comment, user: member, announcement: announcement)

    visit announcement_path(announcement)
    expect(page).to(have_content(member_comment.content))

    within "#comment_#{member_comment.id}" do
      click_button 'Delete Comment'
    end

    sign_in(admin)
    visit announcement_path(announcement)

    expect(page).to(have_content(member_comment.content))
    expect(page).to(have_content('Archive'))
  end

  # --- Rainy Day: Editing a Comment (Admin) ---
  it 'Admin cannot edit members comment' do
    sign_in(admin)
    member_comment = create(:comment, user: member, announcement: announcement)

    visit announcement_path(announcement)
    expect(page).to(have_content(member_comment.content))

    expect(page).not_to(have_content('Edit Comment'))
  end

  # --- Sunny Day: Editing a Comment (Member) ---
  it 'Member editing their own comment' do
    sign_in(member)
    member_comment = create(:comment, user: member, announcement: announcement)
    updated_content = 'Updated message.'

    visit announcement_path(announcement)
    expect(page).to(have_content(member_comment.content))

    within "#comment_#{member_comment.id}" do
      click_link 'Edit Comment'
    end

    within "#edit_comment_#{member_comment.id}", visible: false do
      expect(page).to(have_field('comment[content]', visible: :all))
      fill_in 'comment[content]', with: updated_content, visible: :all
      find_button('Save', visible: :all).click
    end

    expect(page).to(have_content('Comment was successfully updated.'))
    expect(page).to(have_content(updated_content))
    expect(page).to(have_content('updated'))
  end

  # --- Rainy Day: Editing a Comment (Member) ---
  it 'Member editing their own comment with nothing' do
    sign_in(member)
    member_comment = create(:comment, user: member, announcement: announcement)
    updated_content = ''

    visit announcement_path(announcement)
    expect(page).to(have_content(member_comment.content))

    within "#comment_#{member_comment.id}" do
      click_link 'Edit Comment'
    end

    within "#edit_comment_#{member_comment.id}", visible: false do
      expect(page).to(have_field('comment[content]', visible: :all))
      fill_in 'comment[content]', with: updated_content, visible: :all
      find_button('Save', visible: :all).click
    end

    expect(page).to(have_field('comment[content]'))
    expect(page).not_to(have_content('updated'))
  end
end
