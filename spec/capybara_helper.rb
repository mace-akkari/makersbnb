def setup_test_database
  DatabaseConnection.setup
  DatabaseConnection.query("TRUNCATE users RESTART IDENTITY;")
end

def create_user
  User.create(username: "otisvg", full_name: "Otis Vickers-Graver", email: "otisvickersgraver@gmail.com", password: "helloworld")
end

def login
  visit "/sessions/new"
  fill_in "email", with: "otisvickersgraver@gmail.com"
  fill_in "password", with: "helloworld"
  click_button "Log in"
end

def spaces
  visit('/spaces/new')
  fill_in 'description', with: "Space description:"
  fill_in 'location', with: "london"
  fill_in 'availability', with: "2020-12-12"
  click_button "Submit"
end