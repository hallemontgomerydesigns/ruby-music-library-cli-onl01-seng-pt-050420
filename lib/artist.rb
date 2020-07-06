class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs, :genres
  @@all = []
 
 def initialize(name)
   @name = name
   @songs = []
   save
 end
    
  def genres 
   songs.collect{ |s| s.genre }.uniq
 end
    
    
def self.all
  @@all
end

def self.destroy_all
    all.clear
  end
    
def save
  @@all << self
end

def self.create(artist)
  self.new(artist)
end
    
 def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end
end