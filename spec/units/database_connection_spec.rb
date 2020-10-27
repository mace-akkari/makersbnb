require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'connects to the right database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'makersbnb_test')
      DatabaseConnection.setup
    end
  end

  describe '.query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup
      expect(connection).to receive(:exec).with('SELECT * FROM users;')
      DatabaseConnection.query('SELECT * FROM users;')
    end
  end
end
