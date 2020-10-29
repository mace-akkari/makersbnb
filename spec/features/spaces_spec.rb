feature "Spaces for rent" do
  before :each do
    create_user
    create_space
  end
  scenario "Welcoming message" do
    visit "/spaces"
    expect(page).to have_content "Spaces available"
  end

  scenario "display spaces for rent" do
    visit "/spaces"
    expect(page).to have_content "Space description:"
  end

  scenario "display location of the space for rent" do
    visit "/spaces"
    expect(page).to have_content "Location:"
  end

  scenario "display price of the space for rent" do
    visit "/spaces"
    expect(page).to have_content "Price per night:"
  end

  scenario "displey email address" do
    visit "/spaces"
    expect(page).to have_content "Email:"
  end
end
