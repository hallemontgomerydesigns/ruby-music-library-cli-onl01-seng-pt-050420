class Genre
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :songs, :artist
  
  @@all = []
 
 def initialize(name)
   @name = name
   @songs = []
   save
 end
 
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
 
 def artists
    songs.collect{ |s| s.artist }.uniq
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

def self.create(genre)
  self.new(genre)
end
    
end