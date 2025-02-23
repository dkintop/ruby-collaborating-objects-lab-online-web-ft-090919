require 'pry'
class Song 
  attr_accessor :name, :artist  
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @@all << self
  end 
  
  def self.new_by_filename(file)
    song_name = file.split(" - ")[1]
    artist = file.split(" - ")[0]
    song = self.new(song_name)
    song.artist_name = artist
    song
  end
  
  def artist_name=(name)
    self.artist= Artist.find_or_create_by_name(name)
    self.artist.add_song(self)
    #binding.pry
  end 
  
  
  def self.all 
    @@all
  end 
  
  def self.find_by_artist(artist)
    Song.all.select do |song|
      song.artist == artist
    end 
  end 
  
end 
