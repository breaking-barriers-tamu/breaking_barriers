RSpec.describe('Announcement Security', type: :feature) do
    let!(:user) { create(:user, first_name: 'first', last_name: 'last', access_level: 0, registration_completed: true) }
    let!(:announcement) { create(:announcement, title: 'Existing Announcement', body: 'Announcement Body') }
  
    it 'Does not allow non-admins to access the edit announcement page directly' do
        sign_in(user)
        visit edit_announcement_path(announcement)
        
        expect(current_path).to eq(root_path)
        expect(page).to have_content("You are not authorized to perform this action.")
      end

it 'Does not allow non-admins to access the new announcement page directly' do
    sign_in(user)
    visit new_announcement_path
    
    expect(current_path).to eq(root_path)
    expect(page).to have_content("You are not authorized to perform this action.")
  end
  
  it 'Does not allow non-admins to destroy an announcement' do
    sign_in(user)
    expect(Announcement.exists?(announcement.id)).to be(true)
    page.driver.submit :delete, announcement_path(announcement), {}
    expect(current_path).to eq(root_path) 
    expect(page).to have_content("You are not authorized to perform this action.")
    expect(Announcement.exists?(announcement.id)).to be(true)
  end

  end
  