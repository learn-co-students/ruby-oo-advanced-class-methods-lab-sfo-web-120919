class Song
  attr_accessor :name, :artist_name
  @@all = []   #1 create @@all array

  def self.all
    @@all        #2 expose @@all array by creating a class method 
  end            # named "all"

  def save
    self.class.all << self    ##3 this method saves the new
  end                         ##instance to the @@all array    
                               #self.class  take the instance
  def self.create              #and call "class" which give us the class
    song = self.new            ##now call all method
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.create_by_name(name)
    #return a song instance with that name set as it's
    # name property and saved to all
    new_song = Song.create
    new_song.name = name
    new_song.save
    new_song
  end
  
  
  def self.find_by_name(name)
     @@all.find { |song | song.name == name}
  end


  def self.find_or_create_by_name(name)
    # return instance w/ matching song name
    self.find_by_name(name) || self.create_by_name(name)  || Song.new.name = name
 
    # or create new song with the name and return the new instance
  end

  def self.alphabetical
    @@all.uniq.sort_by do | a | 
      a.name 
    end
  end

  def self.new_from_filename(name)
    song = self.new
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    song
  end



  def self.create_from_filename(filename)
    song = self.new
    song.name = (filename.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (filename.split(" - ")[0])
    @@all << song
    song
  end



  def self.destroy_all
   @@all.clear
  end

end
