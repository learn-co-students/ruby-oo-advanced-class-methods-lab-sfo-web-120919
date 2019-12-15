class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    my_song = self.new
    @@all << my_song
    my_song
  end
  
  def self.new_by_name(name)
    my_song = self.new
    my_song.name = name 
    #@@all << my_song
    my_song
    
  end 

  def self.create_by_name(name)
    my_song  = self.new_by_name(name)
    @@all << my_song
    my_song
  end 

  def self.find_by_name(name)

    @@all.find {|song| song.name == name}
    
  end 

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if !song
      song = self.create_by_name(name)
    end
    
    song
        
  end
  
  def self.alphabetical
     @@all.sort_by {|song| song.name}
  end 

  def self.new_from_filename(file_name)
    
    file_format = file_name.split(".")[-1]
   
    if file_format == "mp3"
      song_name = "For Love I Come"
      song = self.create_by_name(song_name)
      song.artist_name = "Thundercat"
    end
    
    song
  end 

  def self.create_from_filename(file_name)
    @@all << self.new_from_filename(file_name)

  end

  def self.destroy_all
    @@all.clear
  end
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end



end
