# feature "requests" do
#   scenario "Tenant creates a new request for a property. Landlord logs in and sees the request at /requests" do
#     #set up
#     create_user("landlord")
#     create_user("tenant")
#     create_space
#     #actions
#     login("tenant")
#     fill_in "date", with: "15/02/2021"
#     click_button "rent-1"
#     click_button "Submit"
#     # Request created
#     click_button "Log out"
#     login("landlord")
#     visit "/requests"
#     expect(page).to have_content "Big house"
#     expect(page).to have_content "01/01/2021"
#   end
# end

feature "confirmation message" do
  before :each do
    create_user("landlord")
    create_user("tenant")
    create_space
    login("tenant")
    visit "/spaces"
    fill_in "date", with: "15/02/2021"
    click_button "rent-1"
  end
  scenario "tenant sees the confirmation message" do
    #actions
    expect(page).to have_content "Your booking request for nice flat on 2021-02-15 has been sent"
  end

  scenario "landlord can log in and see request" do
    login("landlord")
    visit "/requests"
    expect(page).to have_content "nice flat"
    expect(page).to have_content "2021-02-15"
  end
end
