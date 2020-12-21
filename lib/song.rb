require "pry"

class Song

  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(filename)

    #separate the filename
    artist = filename.split(" - ")[0]
    name = filename.split(" - ")[1]

    #create a new instance
    song = Song.new(name)
    
    #associate instance with artist
    song.artist_name = artist
    
    song
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)

    artist.add_song(self)
  end

end