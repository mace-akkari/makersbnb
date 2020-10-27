feature "A user can log in" do
  scenario "User logs in and sees their name on the homepage" do
    create_user
    login
    expect(page).to have_content("Welcome back, otisvg")
  end
end
