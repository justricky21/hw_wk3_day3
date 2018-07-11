require("pry-byebug")
require_relative("../models/album")
require_relative("../models/artist")

p Album.find_by_artist(1)
