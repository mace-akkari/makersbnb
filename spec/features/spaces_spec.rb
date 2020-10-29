feature "Spaces for rent" do
  before :each do
    create_user
    create_space
  end
  scenario "display spaces for rent" do
    visit "/spaces"
    expect(page).to have_content "Space description: nice flat"
  end

  scenario "display location of the space for rent" do
    visit "/spaces"
    expect(page).to have_content "Location: London"
  end

  scenario "display price of the space for rent" do
    visit "/spaces"
    expect(page).to have_content "Price per night: 100"
  end

  scenario "display email address" do
    visit "/spaces"
    expect(page).to have_content "Email: otisvickersgraver@gmail.com"
  end
end
