
def setup_test_database
  DatabaseConnection.setup
  DatabaseConnection.query("TRUNCATE users RESTART IDENTITY;")
end

def create_user
  User.create(username: 'otisvg', full_name: 'Otis Vickers-Graver', email: 'otisvickersgraver@gmail.com', password: 'helloworld')
end
