feature "requests" do
  scenario "Tenant creates a new request for a property. Landlord logs in and sees the request at /requests" do
    #set up
    create_user
    create_second_user
    create_space
    #actions
    login
    save_and_open_page
    click_button "rent-1"
    fill_in "date", with: "01/01/2021"
    click_button "Submit"
    # Request created
    click_link "Log out"
    login_second_user
    visit "/requests"
    expect(page).to have_content "Big house"
    expect(page).to have_content "01/01/2021"
  end
end
