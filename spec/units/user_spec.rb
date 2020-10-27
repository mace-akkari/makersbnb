describe User do
  describe '.create' do
    it 'creates a new user' do
      User.create(username: 'otisvg', full_name: 'Otis Vickers-Graver', email: 'otisvickersgraver@gmail.com', password: 'helloworld')
      user = User.find(1)
      expect(user.username).to eq 'otisvg'
      expect(user.full_name).to eq 'Otis Vickers-Graver'
      expect(user.email).to eq 'otisvickersgraver@gmail.com'
      expect(user.password).to eq 'helloworld'
    end
  end
end
