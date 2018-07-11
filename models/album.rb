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

end
