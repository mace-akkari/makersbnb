feature "sign up" do
  scenario "visit sign up form through homepage, see name displayed after sign up" do
    visit "/"
    click_link "Sign up"
    fill_in "username", with: "ds.danielh"
    fill_in "email", with: "dan@gmail.com"
    fill_in "full_name", with: "Dan Holmes"
    fill_in "password", with: "hunter2"
    click_button "Submit"

    expect(page).to have_content "Welcome ds.danielh"
  end
end
