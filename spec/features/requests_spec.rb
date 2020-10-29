feature "requests" do
  scenario "Tenant creates a new request for a property. Landlord logs in and sees the request at /requests" do
    #set up
    create_user("landlord")
    create_user("tenant")
    create_space
    #actions
    login("tenant")
    fill_in "date", with: "15/02/2021"
    click_button "rent-1"
    click_button "Submit"
    # Request created
    click_button "Log out"
    login("landlord")
    visit "/requests"
    expect(page).to have_content "Big house"
    expect(page).to have_content "01/01/2021"
  end
end

feature "confirmation message" do
  scenario 'tenant sees the confirmation message' do
    create_user("landlord")
    create_user("tenant")
    create_space
    #actions
    login("tenant")
    fill_in "date", with: "15/02/2021"
    click_button "rent-1"
    expect(page).to have_content "Your booking request for  nice flat on 15/02/2021 has been sent"
  end
end
