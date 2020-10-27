feature 'A user can log in' do
  scenario 'User logs in and sees their name on the homepage' do
    create_user
    visit '/'
    click_link 'Log in'
    fill_in 'email', with: 'otisvickersgraver@gmail.com'
    fill_in 'password', with: 'helloworld'
    click_button 'Log in'
    expect(page).to have_content('Welcome back, otisvg')
  end
end
