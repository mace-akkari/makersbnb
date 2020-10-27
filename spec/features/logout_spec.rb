feature "logout" do
  scenario "Log out by clicking a button on the home page" do
    create_user
    login
    visit "/"
    click_button "Log out"

    expect(page).to have_content "Successfully logged out"
  end
end
