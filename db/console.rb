require("pry-byebug")
require_relative("../models/album")
require_relative("../models/artist")

album = Album.find(1)

album.title = 'And Justice For All'

album.update()
