feature "requests" do
  scenario "Tenant creates a new request for a property. Landlord logs in and sees the request at /requests" do
    #set up
    create_user
    create_second_user
    create_space
    #actions
    login
    find("1").click_button "Rent me"
    fill_in "start_date", with: "01/01/2021"
    fill_in "end_date", with: "17/01/2021"
    click_button "Submit"
    # Request create
    click_link "Log out"
    login_second_user
    visit "/requests"
    expect(page).to have_content "Big house"
    expect(page).to have_content "01/01/2021"
    expect(page).to have_content "17/01/2021"
  end
end
