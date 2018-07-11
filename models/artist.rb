require('pg')
require_relative('../db/sqlrunner')
require_relative('album')
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

  def self.all
    sql = "SELECT * FROM artists"
    artists = SQLRunner.run(sql)
    return artists.map { |artists_hash| Artist.new(artists_hash) }
  end

end
