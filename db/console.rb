require("pry-byebug")
require_relative("../models/album")
require_relative("../models/artist")

album1 = Album.find(2)

p album1.artist
