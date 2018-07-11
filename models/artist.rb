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

  def self.find(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    artists = SQLRunner.run(sql, values)
    artist_hash = artists.first
    return Artist.new(artist_hash)
  end

  def update
    sql = "UPDATE artists SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SQLRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM artists WHERE id = $1"
    values = [@id]
    SQLRunner.run(sql, values)
  end

end
