require('pg')
require_relative('../db/sqlrunner')
class Album
  attr_accessor :title, :genre, :artist_id
  attr_reader :id
  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id']
    @id = options['id']
  end

  def save()
    sql = "INSERT INTO albums
    (title, genre, artist_id)
    VALUES ($1, $2, $3)
    RETURNING id;"
    values = [@title, @genre, @artist_id]
    @id = SQLRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM albums"
    albums = SQLRunner.run(sql)
    return albums.map { |albums_hash| Album.new(albums_hash) }
  end

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    albums = SQLRunner.run(sql, values)
    album_hash = albums.first
    return Album.new(album_hash)
  end

  def self.find_by_artist(id)
    @artist_id = id
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@artist_id]
    albums = SQLRunner.run(sql, values)
    return albums.map { |albums_hash| Album.new(albums_hash)  }
  end

  def artist
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    artists = SQLRunner.run(sql, values)
    artist_hash = artists.first
    return Artist.new(artist_hash)
  end

end
