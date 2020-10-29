def setup_test_database
  DatabaseConnection.setup
  DatabaseConnection.query("TRUNCATE users RESTART IDENTITY;")
  DatabaseConnection.query("TRUNCATE spaces RESTART IDENTITY;")
end

def create_user
  User.create(id: 1, username: "otisvg", full_name: "Otis Vickers-Graver", email: "otisvickersgraver@gmail.com", password: "helloworld")
end

def create_second_user
  User.create(id: 2, username: "ds.danielh", full_name: "Dan Holmes", email: "dan@gmail.com", password: "hunter2")
end

def login
  visit "/sessions/new"
  fill_in "email", with: "otisvickersgraver@gmail.com"
  fill_in "password", with: "helloworld"
  click_button "Log in"
end

def login_second_user
  visit "/sessions/new"
  fill_in "email", with: "dan@gmail.com"
  fill_in "password", with: "hunter2"
  click_button "Log in"
end

def spaces
  visit("/spaces/new")
  fill_in "description", with: "Big house"
  fill_in "location", with: "london"
  fill_in "availability", with: "2020-12-12"
  click_button "Submit"
end

def create_space
  Space.create(description: "nice flat", location: "London", price: 100, start_date: Date.new(2021, 2, 12), end_date: Date.new(2021, 5, 20), user_id: 1)
end
