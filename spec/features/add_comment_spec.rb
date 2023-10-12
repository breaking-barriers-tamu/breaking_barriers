require 'rails_helper'

describe 'Comment Feature', type: :feature do
  let!(:user) { create(:user, first_name: 'first_name_1', last_name: 'last_name_1', access_level: 1, registration_completed: true) }
  let!(:announcement) { create(:announcement) }

  # --- Sunny Day: Adding a Valid Comment ---
  it 'Add a valid comment' do
    sign_in(user)
    visit announcement_path(announcement)
    comment_content = 'This is a valid comment.'

    fill_in 'comment_box', with: comment_content
    click_button 'Add Comment'

    expect(page).to have_content('Comment was successfully created.')
    expect(page).to have_content(comment_content)
  end

  # --- Rainy Day: Adding an Empty Comment ---
  it 'Add an empty comment' do
    sign_in(user)
    visit announcement_path(announcement)
    # Leaving the comment content empty

    click_button 'Add Comment'

    expect(page).to have_content('Invalid Comment. Cannot add empty comment')
    expect(page).not_to have_content('This is a valid comment.')
  end
end
