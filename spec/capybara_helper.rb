def setup_test_database
  DatabaseConnection.setup
  DatabaseConnection.query("TRUNCATE users RESTART IDENTITY;")
  DatabaseConnection.query("TRUNCATE spaces RESTART IDENTITY;")
end

def create_user
  User.create(id: 1, username: "otisvg", full_name: "Otis Vickers-Graver", email: "otisvickersgraver@gmail.com", password: "helloworld")
end

def login
  visit "/sessions/new"
  fill_in "email", with: "otisvickersgraver@gmail.com"
  fill_in "password", with: "helloworld"
  click_button "Log in"
end

def create_space
  Space.create(description: "nice flat", location: "London", price: 100, availability: Date.new(2021, 2, 12), user_id: 1)
end
