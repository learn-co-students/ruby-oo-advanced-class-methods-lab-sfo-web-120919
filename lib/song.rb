class Song

  attr_reader :name
  attr_accessor :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

def self.create 
  song = self.new
  @@all << song
  return song
end

def self.new_by_name(name)
  song = self.new
  song.name = name
  song
end 

def name=(name)
  @name = name
end

def self.create_by_name(name)
  song = self.new
  song.name = name
  @@all << song
  return song
end

def self.find_by_name(name)
  self.all.find do |s|
    name == s.name
  end
end

def self.find_or_create_by_name(name)
  create_by_name(name)
  find_by_name(name)
end

def self.alphabetical
  @@all.sort_by do |a|
    a.name
  end
end

def self.new_from_filename(name)
  song = self.new
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    @@all << song
    artist_name = self.new
    song

end

def self.create_from_filename(name)
  @@all << new_from_filename(name)
end

def self.destroy_all
  @@all.clear
end

end
