feature "requests" do
  scenario "Tenant creates a new request for a property. Landlord logs in and sees the request at /requests" do
    #set up
    create_user("landlord")
    create_user("tenant")
    create_space
    #actions
    login("tenant")
    click_button "rent-1"
    fill_in "date", with: "01/01/2021"
    click_button "Submit"
    # Request created
    click_button "Log out"
    login("landlord")
    visit "/requests"
    expect(page).to have_content "Big house"
    expect(page).to have_content "01/01/2021"
  end
end
