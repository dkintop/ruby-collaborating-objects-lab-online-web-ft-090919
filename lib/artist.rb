require "pry"
class Artist
  
  attr_accessor :name, :songs 
  @@all = []
  
  
  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end 
  

  
  def add_song(song)
    song.artist = self
    #@songs << song 
   # binding.pry
  end 
  
  def save
    @@all << self
  end 
  
  def self.all 
   @@all 
  end 
  
  def self.find_or_create_by_name(name)
    if self.find(name)
      self.find(name)
    else
      self.create(name)
    end
  end


  def self.find(name)
    @@all.find do |artist|
      artist.name == name
    end
  end

  def self.create(name)
    artist = self.new(name)
    artist
  end
    
   
  
  def print_songs
     
     
     
     songs.each{|song| puts song.name} 
     
  end
  
  def self.all
    @@all 
  end 
  
  def songs 
    #binding.pry
    #artist_songs = Song.all.select do|song|
      #song.artist == self
      Song.find_by_artist(self)
    #end 
    #Pry.config.input = STDIN
    #Pry.config.output = STDOUT
    #binding.pry
    #artist_songs
  end 
  
  
  

end 