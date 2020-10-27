require 'pg'

class DatabaseConnection
  def self.setup
    @connection = PG.connect(dbname: self.dbname)
  end

  def self.query(sql)
    @connection.exec(sql)
  end

  def self.dbname
    if ENV['ENVIRONMENT'] == 'test'
      'makersbnb_test'
    else
      'makersbnb'
    end
  end
end
