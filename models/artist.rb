require('pg')
require_relative('../db/sqlrunner')
class Artist
  attr_accessor :name
  attr_reader :id
  def initialize(options)
    @name = options['name']
    @id = options['id']
  end

  def save()
    sql = "INSERT INTO artists
    (name)
    VALUES ($1)
    RETURNING id;"
    values = [@name]
    @id = SQLRunner.run(sql, values)[0]['id'].to_i
  end

end
