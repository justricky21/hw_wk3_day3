require("pry-byebug")
require_relative("../models/album")
require_relative("../models/artist")

album = Artist.find(4)

album.delete()
