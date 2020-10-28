feature "Spaces for rent" do

  scenario "Welcoming message" do
    visit "/spaces"
    expect(page).to have_content "Spaces available"
  end

  scenario "display spaces for rent" do
    spaces
    expect(page).to have_content "Space description:"
  end

  scenario "display location of the space for rent" do
    visit "/spaces"
    expect(page).to have_content "Location:"
  end

end