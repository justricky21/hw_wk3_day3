require("pry-byebug")
require_relative("../models/album")
require_relative("../models/artist")

album = Album.new('title' => 'And Justice For All', 'genre' => 'Thrash Metal', 'artist_id' => '1' )

album.save
