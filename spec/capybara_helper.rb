def setup_test_database
  DatabaseConnection.setup
  DatabaseConnection.query("TRUNCATE users RESTART IDENTITY;")
  DatabaseConnection.query("TRUNCATE spaces RESTART IDENTITY;")
  DatabaseConnection.query("TRUNCATE requests RESTART IDENTITY;")
end

def create_user(user = "otisvg")
  visit "/users/new"
  fill_in "username", with: user
  fill_in "full_name", with: "Otis Vickers-Graver"
  fill_in "email", with: user + "@gmail.com"
  fill_in "password", with: "helloworld"
  click_button "Submit"
end

def login(user = "otisvg")
  visit "/sessions/new"
  fill_in "email", with: user + "@gmail.com"
  fill_in "password", with: "helloworld"
  click_button "Log in"
end

def create_space
  Space.create(description: "nice flat", location: "London", price: 100, start_date: Date.new(2021, 2, 12), end_date: Date.new(2021, 5, 20), user_id: 1)
end
